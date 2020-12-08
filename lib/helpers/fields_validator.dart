extension FieldValidate on String {
  String validatePhone() {
    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(this)) {
      return "change to localization error";
    }
    return null;
  }

  String validateEmail() {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(this)) {
      return "change to localization error";
    }
    return null;
  }

  String validateLength({int min = 0, int max}) {
    if (length < min) {
      return "change to localization error";
    } else if (length > max) {
      return "change to localization error";
    }
    return null;
  }

}
