/// ui EventBus response about showing any ui changes
abstract class UiEvent {
  const UiEvent();
  bool get isUrgent => false; // must be shown immediately
  bool get isAlwaysTop => false; // can't be under any ui
}

//
class DioErrorEvent extends UiEvent {
  final String message;

  const DioErrorEvent(this.message);
}

class UserRegisterEvent extends UiEvent {
  const UserRegisterEvent();
}

class UserLoggedEvent extends UiEvent {
  const UserLoggedEvent();
}

class UserLoggedOutEvent extends UiEvent {
  const UserLoggedOutEvent();
}

class InternetConnectionFailedEvent extends UiEvent {
  const InternetConnectionFailedEvent();
}
