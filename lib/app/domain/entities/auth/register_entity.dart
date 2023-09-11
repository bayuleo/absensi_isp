class RegisterEntity {
  final String email;
  final String password;

  RegisterEntity({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
