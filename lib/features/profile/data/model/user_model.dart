class UserModel {
  final String? id;
  final String? email;
  final String? fullName;
  final String? phoneNumber;
  final String? birthDate;
  final String? image;

  UserModel({
    this.image,
    this.id,
    this.email,
    this.fullName,
    this.phoneNumber,
    this.birthDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'birthDate': birthDate,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return UserModel(
      id: json['id'],
      image: json['image'],
      email: json['email'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      birthDate: json['birthDate'],
    );
  }
}
