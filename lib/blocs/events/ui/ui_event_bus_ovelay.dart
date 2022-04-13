import 'dart:async';
import 'dart:collection';
import 'dart:developer';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/events/ui/ui_events_bus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final uiEventBusProviderRef = Provider<EventBus>((ref) => EventBus());

typedef UIEventHandler = FutureOr<void> Function(UiEventBus);

class UiEventBusOverlay extends ConsumerStatefulWidget {
  final Widget child;
  final UIEventHandler onListen;
  const UiEventBusOverlay({
    Key? key,
    required this.child,
    required this.onListen,
  }) : super(key: key);

  @override
  _UiEventBusOverlayState createState() => _UiEventBusOverlayState();
}

class _UiEventBusOverlayState extends ConsumerState<UiEventBusOverlay>
    with WidgetsBindingObserver {
  final Queue<UiEventBus> _eventQueue = ListQueue();
  final Queue<UiEventBus> _priorityQueue = ListQueue();
  int _topCount = 0;
  int _handlesCount = 0;
  late StreamSubscription _subscription;

  void _initEventBus(WidgetRef ref) {
    final eventBus = ref.read(uiEventBusProviderRef);

    _subscription = eventBus.on<UiEventBus>().listen((event) {
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

  Future<void> _execute(UiEventBus event) async {
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
    log('initState UiEventBusOverlay');

    _initEventBus(ref);

    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    log("$state in UiEventBusOverlay");
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
    log('dispose UiEventBusOverlay');
    _eventQueue.clear();
    _subscription.cancel();

    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('build UiEventBusOverlay');
    return widget.child;
  }
}
