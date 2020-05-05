import 'package:flutter/cupertino.dart';

class UserSignIn{
  String email, password;

  UserSignIn({@required this.email, @required this.password});

  Map<String, dynamic> toJson(){
    return {
      "email": email,
      "password": password
    };
  }

}