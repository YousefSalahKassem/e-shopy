import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

typedef UIEventHandler = FutureOr<void> Function(UIEvent);

class UiEventBusOverlay extends ConsumerStatefulWidget {
  final Widget child;
  final UIEventHandler onListen;

  const UiEventBusOverlay({
    super.key,
    required this.child,
    required this.onListen,
  });

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
