class Users {
  String name;
  String email;
  String password;

  Users({this.name, this.email, this.password});

  set setusername(String newname) {
    this.name = newname;
  }

  set setemail(String newemail) {
    this.name = newemail;
  }

  set setpassword(String newpassword) {
    this.password = newpassword;
  }

  String get getname {
    return name;
  }

  String get getemail {
    return email;
  }

  String get getpassword {
    return password;
  }
}
