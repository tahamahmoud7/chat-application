

class MyUser {
  static const String COLLECTION_NAME="Users";
  String id;
  String fistName;
  String userName;
  String email;

  MyUser({required this.id,
    required this.email,
    required this.fistName,
    required this.userName});

  MyUser.fromJson(Map<String, dynamic>json) :this
      (
      id: json["id"],
      email: json["email"],
      fistName: json["fistName"],
      userName: json["userName"],

    );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userName": userName,
      "fistName": fistName,
      "email": email,


    };
  }
}