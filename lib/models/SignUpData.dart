class SignUpData {
  String? fullname;
  String? email;
  String? mobile;
  String? password;
  SignUpData({this.fullname, this.email, this.mobile, this.password});
  Map<String, dynamic> toJson() => {
    "fullname": this.fullname,
    "email": this.email,
    "mobile": this.mobile,
    "password": this.password
  };
}