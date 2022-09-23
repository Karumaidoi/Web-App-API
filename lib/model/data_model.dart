class User {
  late int id;
  late int age;
  late String message;

  User({required this.age, required this.id, required this.message});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(age: json["Age"], id: json["ID"], message: json['Message']);
  }
}
