class RequestLogin {
  String? username;
  String? password;

  RequestLogin({
    this.username,
    this.password
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password
    };
  }
}