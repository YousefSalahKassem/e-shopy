import 'package:kortobaa_core_package/kortobaa_core_package.dart';


// /// ui EventBus response about showing any ui changes
//TODO add to core
extension UIEventVars on UIEvent {
  bool get isUrgent => false; // must be shown immediately
  bool get isAlwaysTop => false; // can't be under any ui
}

//
class DioErrorEvent extends UIEvent {
  final String message;

  const DioErrorEvent(this.message);
}

class UserRegisterEvent extends UIEvent {
  const UserRegisterEvent();
}

class UserLoggedEvent extends UIEvent {
  const UserLoggedEvent();
}

class UserLoggedOutEvent extends UIEvent {
  const UserLoggedOutEvent();
}
