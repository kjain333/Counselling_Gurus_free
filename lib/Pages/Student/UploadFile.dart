import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';


class UploadFile extends StatefulWidget {
  @override
  _UploadFile createState() => new _UploadFile();
}
List<File> files = new List<File>(10);
final string = ["Profile Image","Class 10 Marksheet","Class 12 Marksheet","Aadhar Card","Jee Mains Admit Card","Jee Advance Admit Card","Category Certificate","Pwd Certificate","Income Certificate","Other Application"];
class _UploadFile extends State<UploadFile> {
  bool _hasValidMime = false;
  FileType _pickingType = FileType.image;
  @override
  void initState() {
    super.initState();
  }

  void Upload(int index) async {
    File file;
    if (_pickingType != FileType.custom || _hasValidMime) {
      try {
        file = await FilePicker.getFile();
        final size = file.lengthSync()/1024;
        print(size);
        if(size>100)
          {
            Toast.show("File size should be less than 100 Kb. Please upload Again", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
            file = null;
            return;
          }
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
      if (!mounted) return;
      setState(() {
        files[index] = file;
      });
    }
  }
  Future uploadFile(List<File> files) async {
    for(int i=0;i<files.length;i++)
      {
        if(files[i]==null)
          continue;
        StorageReference storageReference = FirebaseStorage.instance
            .ref()
            .child('MenteeName/StudentName/'+string[i]);
        StorageUploadTask uploadTask = storageReference.putFile(files[i]);
        await uploadTask.onComplete;
      }
    print('Complete');
    showDialog(
        context: context,
        builder: (BuildContext context){
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                height: 150,
                width: 150,
                color: Colors.orangeAccent,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Document Files have been uploaded Successfully",style: GoogleFonts.aBeeZee(fontSize: 18,color: Colors.white),),
                ),
              ),
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text("Upload Documents",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 23),),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text("Afraid about the Counselling procedure? Make sure lack of documents doesn't stop you from getting your dream College. Upload all documents as listed below and your mentor will verify them", style: GoogleFonts.aBeeZee(fontSize: 13),),
            ),
            SizedBox(
              height: 20,
            ),
            MyTile(0, context),
            MyTile(1, context),
            MyTile(2, context),
            MyTile(3, context),
            MyTile(4, context),
            MyTile(5, context),
            MyTile(6, context),
            MyTile(7, context),
            MyTile(8, context),
            MyTile(9, context),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              color: Colors.pinkAccent,
              onPressed: (){
                uploadFile(files);
              },
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text("Submit",style:  GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
              )
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
  Widget MyTile(int index,BuildContext context){
    return Column(
      children: <Widget>[
        Container(
          height: 2,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.shade300,
        ),

        Padding(
          padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                (files[index]!=null)?Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(files[index]),
                        fit: BoxFit.fill,
                      )
                  ),
                ):Container(height: 50,width: 50,child: Icon(Icons.warning,size: 30,color: Colors.amber,)),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width-220,
                  child: Text(string[index],style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300),),
                ),
                IconButton(
                  icon: Icon(Icons.file_upload,size: 30,color: Colors.grey.shade600,),
                  onPressed: (){
                    Upload(index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete,size: 30,color: Colors.grey.shade600,),
                  onPressed: (){
                    setState(() {
                      files[index] = null;
                    });
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
