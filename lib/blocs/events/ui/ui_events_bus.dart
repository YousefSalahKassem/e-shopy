abstract class UiEventBus {
  const UiEventBus();
}

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
