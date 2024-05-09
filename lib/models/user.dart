class User {
  String id;
  String username;
  String email;
  String password;
  int isverified;
  String userCode;
  String verificationToken;
  String region;
  int numeroTelephone;
  List<Role> roles;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.isverified,
    required this.userCode,
    required this.verificationToken,
    required this.numeroTelephone,
    required this.region,
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
      numeroTelephone: json['numeroTelephone'],
      region: json['region'],
      roles: List<Role>.from(json['roles'].map((roleJson) => Role.fromJson(roleJson))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password, // Make sure to handle password securely on the server side
      'isverified': isverified,
      'userCode': userCode,
      'verificationToken': verificationToken,
      'numeroTelephone': numeroTelephone,
      'region': region,
    };
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
