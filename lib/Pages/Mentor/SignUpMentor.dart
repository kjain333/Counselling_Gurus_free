//import 'dart:convert';
//import 'package:counselling_gurus/Pages/Student/IntroSlider.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import '../../Animations/FadeAnimation.dart';
//import 'package:http/http.dart' as http;
//import '../../models/UserModelSignUp.dart';
import 'MentorInfo.dart';
import '../../Resources/Colors.dart' as color;

class SignUpMentor extends StatefulWidget {
  @override
  _SignUpMentorState createState() => _SignUpMentorState();
}

class _SignUpMentorState extends State<SignUpMentor> with SingleTickerProviderStateMixin {

 /* TextEditingController nameController = new TextEditingController();
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

  signUpUser() async{
    print(user.toJson());
    await http.post('http://192.168.43.70:3060/postsignupapp', body: user.toJson(), headers: {"Accept": "application/json"}).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context) => IntroSlider()));
      }
      print(jsonDecoder.convert(res));
      return jsonDecoder.convert(res);
    });
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
*/
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
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
              SizedBox(height: 20),
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
                          SizedBox(height: 60,),
                          FadeAnimation(1.2, Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10)
                                )]
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: TextField(
                                   // controller: nameController,
                                    decoration: InputDecoration(
                                        hintText: "Full Name",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: TextField(
                                    //controller: contactController,
                                    decoration: InputDecoration(
                                        hintText: "Contact Number",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: TextField(
                                    //controller: emailController,
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: TextField(
                                  //  controller: passwordController,
                                   // obscureText: !passwordVisible,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                           // passwordVisible?
                                           // Icons.visibility:
                                            Icons.visibility_off,
                                            color: Theme.of(context).primaryColorDark,
                                          ),
                                          onPressed: (){
                                            setState(() {
                                             // passwordVisible = !passwordVisible;
                                            });
                                          },
                                        )
                                    ),
                                  ),
                                ),
                              ],
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => MentorInfo()));
                                      /*setState(() {
                                        isLoading = true;
                                      });
                                      isLoading ? Center(
                                          child: CircularProgressIndicator()
                                      ): Container();
                                      setState(() {
                                        name = nameController.text.toString();
                                        email = emailController.text.toString();
                                        password = passwordController.text.toString();
                                        contact = contactController.text.toString();
                                        user = new UserSignUp( name: name, email: email, password: password,
                                            contact: contact
                                        );
                                      });
                                      addToSF();
                                      signUpUser();*/
                                    },
                                    child: Center(
                                      child: Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(height: 50,),
                          FadeAnimation(1.5, Text("Continue with social media", style: TextStyle(color: Colors.grey),)),
                          SizedBox(height: 30,),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: FadeAnimation(
                                    1.8,
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.blue),
                                      child: Center(
                                        child: Text(
                                          "Facebook",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: FadeAnimation(
                                    1.9,
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.black),
                                      child: Center(
                                        child: Text(
                                          "Github",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )),
                              )
                            ],
                          )
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
