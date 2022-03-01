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
  UiEventBus? _currentEvent;
  late StreamSubscription _subscription;

  void _initEventBus(WidgetRef ref) {
    final eventBus = ref.read(uiEventBusProviderRef);

    _subscription = eventBus.on<UiEventBus>().listen((event) {
      _eventQueue.add(event);
      _handleEvents(event);
    });
  }

  Future<void> _handleEvents([UiEventBus? newEvent]) async {
    if (_eventQueue.isEmpty) return;
    final canBeHandled = _currentEvent == null ||
        (newEvent?.isUrgent == true && _currentEvent?.isAlwaysTop == false);
    if (!canBeHandled) return;
    final event = newEvent ?? _eventQueue.first;
    _currentEvent = event;
    await widget.onListen(event);
    _eventQueue.remove(event);
    _currentEvent = null;
    return _handleEvents();
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
