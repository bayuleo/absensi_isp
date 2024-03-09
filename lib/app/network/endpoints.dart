class Endpoints {
  late AuthEndpoint auth;
  late UsersEndpoint users;
  late AbsenEndpoint absent;
  late IjinEndpoint ijin;
  late AdminEndpoint admin;

  Endpoints() {
    auth = AuthEndpoint();
    users = UsersEndpoint();
    absent = AbsenEndpoint();
    ijin = IjinEndpoint();
    admin = AdminEndpoint();
  }
}

class AuthEndpoint {
  final String login;
  final String forgotPassword;
  final String otp;
  final String changePassword;

  AuthEndpoint({
    this.login = '/auth/login',
    this.forgotPassword = '/auth/forgot-password',
    this.otp = '/auth/check-otp',
    this.changePassword = '/auth/change-password',
  });
}

class UsersEndpoint {
  final String profile;

  UsersEndpoint({
    this.profile = "/users/get/me",
  });
}

class AbsenEndpoint {
  final String checkIn;
  final String checkOut;
  final String myAbsent;
  final String detail;

  AbsenEndpoint(
      {this.checkIn = "/absent/in",
      this.checkOut = "/absent/out",
      this.myAbsent = "/absent/users",
      this.detail = "/absent"});
}

class IjinEndpoint {
  final String countIjin;
  final String ijin;
  final String users;

  IjinEndpoint({
    this.countIjin = "/ijin/count/status",
    this.ijin = "/ijin",
    this.users = "/ijin/users",
  });
}

class AdminEndpoint {
  final String users;
  final String dashboardAbsen;
  final String dashboardIjin;
  final String tunjangan;

  AdminEndpoint({
    this.users = "/users",
    this.dashboardAbsen = "/absent/admin/dashboard",
    this.dashboardIjin = "/ijin/admin/dashboard",
    this.tunjangan = "/users/tunjangan",
  });
}
