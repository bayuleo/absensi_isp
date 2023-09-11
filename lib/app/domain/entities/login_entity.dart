class LoginEntity {
  final int id;
  final String nama;
  final String email;
  final String phone;
  final String gender;
  final String birthDate;
  final String token;
  final String refreshToken;

  LoginEntity({
    required this.id,
    required this.nama,
    required this.email,
    required this.phone,
    required this.gender,
    required this.birthDate,
    required this.token,
    required this.refreshToken,
  });
}
