class UserModel {
  final String username, email;

  UserModel({
    required this.username,
    required this.email,
  });

  factory UserModel.fromJSON(Map parsedJson) {
    return UserModel(
        username: parsedJson['username'], email: parsedJson['email']);
  }
}
