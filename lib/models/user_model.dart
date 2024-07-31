class UserModel {
  String? id, email, password;
  DateTime? timestamp;
  UserModel({
    this.email,
    this.id,
    this.password,
  });

  factory UserModel.fromMap(map) {
    return UserModel(
      email: map["email"],
      password: map["password"],
      id: map["id"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "password": password,
      "id": id,
    };
  }
}
