class AuthEntity {
  final String? token;

  AuthEntity({
    this.token,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}
