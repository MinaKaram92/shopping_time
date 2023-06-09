class UserModel {
  final String name;
  final String phone;
  final String email;
  final String? image;

  UserModel(
      {required this.name,
      required this.phone,
      required this.email,
      this.image});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        image: json['image']);
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'image': image,
    };
  }
}
