import 'dart:async';
import 'dart:developer';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/events/ui/ui_events_bus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final uiEventBusProviderRef = Provider<EventBus>((ref) => EventBus());

class UiEventBusOverlay extends StatefulWidget {
  final Widget child;
  final Function(UiEventBus) onListen;
  const UiEventBusOverlay({
    Key? key,
    required this.child,
    required this.onListen,
  }) : super(key: key);

  @override
  _UiEventBusOverlayState createState() => _UiEventBusOverlayState();
}

class _UiEventBusOverlayState extends State<UiEventBusOverlay>
    with WidgetsBindingObserver {
  late StreamSubscription _subscription;

  void _initEventBus() {
    final eventBus = context.read(uiEventBusProviderRef);

    _subscription = eventBus.on<UiEventBus>().listen((event) {
      widget.onListen(event);
    });
  }

  @override
  void initState() {
    log('initState UiEventBusOverlay');

    _initEventBus();

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
