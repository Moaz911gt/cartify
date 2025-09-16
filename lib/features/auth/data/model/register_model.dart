class RegisterModel {
  final int? id;
  final String? name;
  final String? email;
  final String? password;

  RegisterModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  factory RegisterModel.fromJson(jsonData) {
    return RegisterModel(
      id: jsonData['id'],
      email: jsonData['email'],
      password: jsonData['password'],
      name: jsonData['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'password': password};
  }
}
