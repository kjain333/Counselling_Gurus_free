import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import '../../../Animations/FadeAnimation.dart';
import 'package:http/io_client.dart';
import '../../../models/UserModelSignUp.dart';
import '../../../Resources/Colors.dart' as color;
import '../MainPage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController nameController = new TextEditingController();
  TextEditingController contactController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool passwordVisible, isLoading;
  String name, email, password, contact;
  UserSignUp user;
  JsonDecoder jsonDecoder = new JsonDecoder();
  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) {
      return "Email can't be empty";
    }
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.isEmpty) {
      return "Password can't be empty";
    }
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }
  String contactValidator(String value) {
    if (value.isEmpty) {
      return "Contact can't be empty";
    }
    if (value.length < 10) {
      return 'Enter a valid contact number';
    } else {
      return null;
    }
  }

  String nameValidator(String value) {
    if (value.isEmpty) {
      return "Username can't be empty";
    }
    if (value.length < 3) {
      return 'Enter a valid username';
    } else {
      return null;
    }
  }

   signUpUser() async{
    print(user.toJson());
    final ioc = new HttpClient();
    ioc.badCertificateCallback = (X509Certificate cert,String host,int port)=>true;
    final http = new IOClient(ioc);
    await http.post('https://counsellinggurus.in:3001/auth/signup', body: user.toJson(), headers: {"Accept": "application/json"}).then((response) {
      print(response.body);
      if(response.statusCode==500)
        {
          Toast.show("Internal Server Error. Please try again later.",context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
        }
      else
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
          addToSF();
        }

    }).catchError((error)=>Toast.show("Server Error! Please Check your Internet Connection", context,duration: Toast.LENGTH_LONG));
  }
  addToSF() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("email", emailController.text.toString());
    pref.setString("password", passwordController.text.toString());
    pref.setString("name", nameController.text.toString());
    pref.setString("contact", contactController.text.toString());
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    contactController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                color.bgGrad,
                color.bgGrad1,
                color.bgGrad2,
                color.bgGrad3
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                        1.3,
                        Text(
                          "Welcome Back",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 60),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20,),
                          FadeAnimation(1.2, Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10)
                                )
                                ]
                            ),
                            child: Form(
                              key: _formkey,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(
                                            color: Colors.grey[200]))
                                    ),
                                    child: TextFormField(
                                      validator: nameValidator,
                                      controller: nameController,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(
                                              Icons.person_outline),
                                          hintText: "Full Name",
                                          hintStyle: TextStyle(
                                              color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(
                                            color: Colors.grey[200]))
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      validator: contactValidator,
                                      controller: contactController,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.contacts),
                                          hintText: "Contact Number",
                                          hintStyle: TextStyle(
                                              color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(
                                            color: Colors.grey[200]))
                                    ),
                                    child: TextFormField(
                                      validator: emailValidator,
                                      controller: emailController,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.email),
                                          hintText: "Email",
                                          hintStyle: TextStyle(
                                              color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(
                                            color: Colors.grey[200]))
                                    ),
                                    child: TextFormField(
                                      validator: pwdValidator,
                                      controller: passwordController,
                                      obscureText: !passwordVisible,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.lock_outline),
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey),
                                          border: InputBorder.none,
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              passwordVisible ?
                                              Icons.visibility :
                                              Icons.visibility_off,
                                              color: Theme
                                                  .of(context)
                                                  .primaryColorDark,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                passwordVisible =
                                                !passwordVisible;
                                              });
                                            },
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                          SizedBox(height: 40,),
                          FadeAnimation(1.4,
                              InkWell(
                                child: Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 50),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: color.buttonsMain
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      FormState formState = _formkey
                                          .currentState;
                                      if (formState.validate()) {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        isLoading ? Center(
                                            child: CircularProgressIndicator()
                                        ) : Container();

                                        setState(() {
                                          name = nameController.text.toString();
                                          email =
                                              emailController.text.toString();
                                          password = passwordController.text
                                              .toString();
                                          contact =
                                              contactController.text.toString();
                                          user = new UserSignUp(name: name,
                                              email: email,
                                              password: password,
                                              contact: contact,
                                          );
                                        });

                                        signUpUser();
                                      }
                                    },
                                    child: Center(
                                      child: Text("Sign Up", style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
