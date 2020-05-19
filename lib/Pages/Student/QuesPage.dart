import 'package:flutter/cupertino.dart';
import '../../Fragments/ChatBoxPage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QuesPage extends StatefulWidget {
  @override
  _QuesPageState createState() => _QuesPageState();
}

enum SelectImage { Camera, Gallery }


class _QuesPageState extends State<QuesPage> {
  String userName = '';
  String quesTitle = '';
  String ques = '';
  File imageURI;

  Future<SelectImage> _asyncSimpleDialog(BuildContext context) async {
    return await showDialog<SelectImage>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select Image From'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () => getImageFromCamera(),
                child: const Text('Camera', style: TextStyle(fontSize: 20.0)),
              ),
              SimpleDialogOption(
                onPressed: () => getImageFromGallery(),

                child: const Text('Gallery', style: TextStyle(fontSize: 20.0)),
              )
            ],
          );
        });
  }

  Future getImageFromCamera() async {

    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      imageURI = image;
    });

  }

  Future getImageFromGallery() async {

    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageURI = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Counselling Gurus"),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: (){
                      // code for submitting all details to server database
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatBoxPage()),
                      );
                      Fluttertoast.showToast(
                          msg: "Your Ques will be answered soon!!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    },
                    child: Text('Submit', style: TextStyle(fontSize: 20)),
                  ),
                  TextField(
//                  autofocus: true,
                    decoration: InputDecoration(labelText: 'Your Name'),
                    onChanged: (value) {
                      userName = value;
                    },
                  ),
                  TextField(
//                  autofocus: true,
                    decoration: InputDecoration(labelText: 'Ques title'),
                    onChanged: (value) {
                      quesTitle = value;
                    },
                  ),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
//                  autofocus: true,
                    decoration: InputDecoration(labelText: 'Type your ques'),
                    onChanged: (value) {
                      ques = value;
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                      FloatingActionButton.extended(
                        onPressed: () {
                          _asyncSimpleDialog(context);
                            },
                        icon: Icon(Icons.attachment),
                        label: Text("Want to add an image"),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                        backgroundColor: Colors.blue,
                      ),

                  SizedBox(
                    height: 40.0,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        imageURI == null
                            ? Text('No image selected till now.')
                            : Image.file(imageURI),
                      ]),
                ],
              ),
            ),
          ),
      ),
      );
  }
}




