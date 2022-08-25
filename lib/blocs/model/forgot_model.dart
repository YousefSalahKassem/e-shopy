class ForgotModel {
  final String email;

  const ForgotModel({
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {'email': email.trim()};
  }
}