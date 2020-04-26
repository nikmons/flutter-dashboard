class LoginModel {
  final String message;
  final String username;

  LoginModel(this.message, this.username);

  LoginModel.fromJson(Map<String, dynamic> json) :
      message = json['message'],
      username = json['username'];

  Map<String, dynamic> toJson() =>
      {
        'message' : message,
        'username' : username
      };
}