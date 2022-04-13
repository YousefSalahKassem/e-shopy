/// ui EventBus response about showing any ui changes
abstract class UiEventBus {
  const UiEventBus();
  bool get isUrgent => false; // must be shown immediately
  bool get isAlwaysTop => false; // can't be under any ui
}

//
class DioErrorEvent extends UiEventBus {
  final String message;

  const DioErrorEvent(this.message);
}

class UserRegisterEvent extends UiEventBus {
  const UserRegisterEvent();
}

class UserLoggedEvent extends UiEventBus {
  const UserLoggedEvent();
}

class UserLoggedOutEvent extends UiEventBus {
  const UserLoggedOutEvent();
}

class InternetConnectionFailedEvent extends UiEventBus {
  const InternetConnectionFailedEvent();
}
