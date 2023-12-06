class Endpoints {
  late AuthEndpoint auth;
  late UsersEndpoint users;
  late AbsenEndpoint absent;
  late IjinEndpoint ijin;

  Endpoints() {
    auth = AuthEndpoint();
    users = UsersEndpoint();
    absent = AbsenEndpoint();
    ijin = IjinEndpoint();
  }
}

class AuthEndpoint {
  final String login;

  AuthEndpoint({
    this.login = '/auth/login',
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

  AbsenEndpoint({
    this.checkIn = "/absent/in",
    this.checkOut = "/absent/out",
  });
}

class IjinEndpoint {
  final String countIjin;

  IjinEndpoint({
    this.countIjin = "/ijin/count/status",
  });
}
