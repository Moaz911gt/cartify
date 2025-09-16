class UserInfoModel {
  final String city;
  final String phone;
  final int id;
  final String? name;
  final String? email;
  final String? password;

  UserInfoModel({
    required this.city,
    required this.phone,
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  factory UserInfoModel.fromJson(jsonData) {
    return UserInfoModel(
      id: jsonData['id'],
      email: jsonData['email'],
      password: jsonData['password'],
      name: jsonData['name']['firstname']  + " ${jsonData['name']['lastname']}",
      phone: jsonData['phone'],
      city: jsonData["address"]['city'],
    );
  }
}
