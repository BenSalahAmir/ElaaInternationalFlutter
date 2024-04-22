class User {
  String id;
  String username;
  String email;
  String password;
  int isverified;
  String userCode;
  String verificationToken;
  List<Role> roles;



  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.isverified,
    required this.userCode,
    required this.verificationToken,
    required this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      isverified: json['isverified'],
      userCode: json['userCode'],
      verificationToken: json['verificationToken'],
      roles: (json['roles'] as List).map((role) => Role.fromJson(role)).toList(),
    );
  }
}

class Role {
  String id;
  String name;

  Role({
    required this.id,
    required this.name,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
    );
  }
}
