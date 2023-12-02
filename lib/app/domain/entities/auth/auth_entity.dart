class AuthEntity {
  final int? id;
  final String? email;
  final String? accessToken;
  final String? refreshToken;

  AuthEntity({
    this.id,
    this.email,
    this.accessToken,
    this.refreshToken,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
      };
}
