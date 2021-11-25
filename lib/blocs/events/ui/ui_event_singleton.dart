import 'package:event_bus/event_bus.dart';

class UIEventSingleton {
  static late EventBus eventBus;

  factory UIEventSingleton() {
    return _inst;
  }

  static final UIEventSingleton _inst = UIEventSingleton._internal();

  UIEventSingleton._internal();

  static void init() {
    eventBus = EventBus();
  }
}
