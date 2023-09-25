class Users {
  String? firstname;
  String? lastname;
  String? email;
  String? username;

  Users({this.firstname, this.lastname, this.email, this.username});

  Users fromJson(Map<String, dynamic> json) {
    return Users(
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      username: json['username'],
    );
  }
}
