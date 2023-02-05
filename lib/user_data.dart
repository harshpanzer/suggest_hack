class UserModel {
  String? uid;
  String? email;
  String? userName;
  String? budget;
  String? age;

  UserModel({
    this.uid,
    this.email,
    this.userName,
    this.budget,
    this.age,
  });

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        userName: map['userName'],
        budget: map['budget'],
        age: map['age']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'userName': userName,
      'budget': budget,
      'age': age,
    };
  }
}
