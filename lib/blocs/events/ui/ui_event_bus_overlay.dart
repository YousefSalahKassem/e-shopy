import 'dart:async';
import 'dart:collection';
import 'dart:developer';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/events/ui/ui_events.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

typedef UIEventHandler = FutureOr<void> Function(UIEvent);

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

class _UiEventBusOverlayState extends ConsumerState<UiEventBusOverlay> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
