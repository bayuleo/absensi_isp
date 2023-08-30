class AuthEntity {
  final String? tokenType;
  final int? expiresIn;
  final String? accessToken;
  final String? refreshToken;

  AuthEntity({
    this.tokenType,
    this.expiresIn,
    this.accessToken,
    this.refreshToken,
  });
}
