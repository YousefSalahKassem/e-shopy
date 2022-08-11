import 'dart:async';
import 'dart:collection';
import 'dart:developer';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/events/ui/ui_events.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

final uiEventBusProviderRef = Provider<EventBus>((ref) => EventBus());

typedef UIEventHandler = FutureOr<void> Function(UIEvent);

class UIEventBusOverlay extends ConsumerStatefulWidget {
  final Widget child;
  final UIEventHandler onListen;

  const UIEventBusOverlay({
    Key? key,
    required this.child,
    required this.onListen,
  }) : super(key: key);

  @override
  _UIEventBusOverlayState createState() => _UIEventBusOverlayState();
}

class _UIEventBusOverlayState extends ConsumerState<UIEventBusOverlay>
    with WidgetsBindingObserver {
  final Queue<UIEvent> _eventQueue = ListQueue();
  final Queue<UIEvent> _priorityQueue = ListQueue();
  int _topCount = 0;
  int _handlesCount = 0;
  late StreamSubscription _subscription;

  void _initEventBus() {
    final eventBus = ref.read(uiEventBusProviderRef);

    _subscription = eventBus.on<UIEvent>().listen((event) {
      if (event.isUrgent) {
        _priorityQueue.add(event);
      } else {
        _eventQueue.add(event);
      }
      _handleEvents();
    });
  }

  Future<void> _handleEvents() async {
    if (_eventQueue.isEmpty && _priorityQueue.isEmpty) return;
    if (_topCount > 0) return;

    final priorityEvent = _priorityQueue.isEmpty ? null : _priorityQueue.first;
    if (priorityEvent != null) {
      _priorityQueue.remove(priorityEvent);
      _execute(priorityEvent);
      return;
    } else if (_handlesCount > 0) {
      return;
    }

    final normalEvent = _eventQueue.isEmpty ? null : _eventQueue.first;
    if (normalEvent != null) {
      _eventQueue.remove(normalEvent);
      _execute(normalEvent);
    }
  }

  Future<void> _execute(UIEvent event) async {
    _handlesCount += 1;
    if (event.isAlwaysTop) {
      _topCount += 1;
    }
    await widget.onListen(event);
    _handlesCount -= 1;
    if (event.isAlwaysTop) {
      _topCount -= 1;
    }
    _handleEvents();
  }

  @override
  void initState() {
    log('initState UIEventBusOverlay');

    _initEventBus();

    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    log("$state in UIEventBusOverlay");
    if (state == AppLifecycleState.resumed) {
      _subscription.resume();
    } else {
      if (!_subscription.isPaused) {
        _subscription.pause();
      }
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    log('dispose UIEventBusOverlay');
    _eventQueue.clear();
    _subscription.cancel();

    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('build UIEventBusOverlay');
    return widget.child;
  }
}
