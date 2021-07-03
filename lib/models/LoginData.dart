class LoginData {
  String? usernameOrEmail;
  String? password;
  LoginData({this.usernameOrEmail, this.password});

  Map<String, dynamic> toJson() =>
      {"usernameOrEmail": this.usernameOrEmail, "password": this.password};
}
