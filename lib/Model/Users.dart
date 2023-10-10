class Users {
  String? firstname;
  String? lastname;
  String? email;
  String? username;
  String? phoneNumber;
  String? profileImage;

  Users({
    this.firstname,
    this.lastname,
    this.email,
    this.username,
    this.phoneNumber,
    this.profileImage,
  });

  Users fromJson(Map<String, dynamic> json) {
    return Users(
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      username: json['username'],
      phoneNumber: json['phoneNumber'],
      profileImage: json['profileImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firsname': firstname,
      'lastname': lastname,
      'username': username,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
    };
  }
}
