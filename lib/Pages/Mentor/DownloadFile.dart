import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DownloadFile extends StatefulWidget {
  @override
  _DownloadFile createState() =>
      _DownloadFile();
}
final icons = [Icons.warning,Icons.check,Icons.clear];
final colors = [Colors.amber,Colors.greenAccent,Colors.redAccent];
final code = [0,0,0,0,0,0,0,0,0,0];
final string = ["Profile Image","Class 10 Marksheet","Class 12 Marksheet","Aadhar Card","Jee Mains Admit Card","Jee Advance Admit Card","Category Certificate","Pwd Certificate","Income Certificate","Other Application"];
class FireStorageService extends ChangeNotifier {
  FireStorageService();

  static Future<dynamic> loadFromStorage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}
Future<Widget> _getImage(BuildContext context, String image) async {
  Image m;
  await FireStorageService.loadFromStorage(context, image).then((downloadUrl) {
    m = Image.network(
      downloadUrl.toString(),
      fit: BoxFit.scaleDown,
    );
  });
  return m;
}
List<String> paths = new List<String>(string.length);
class _DownloadFile extends State<DownloadFile> {
  @override
  void initState() {
    super.initState();
    for(int i=0;i<string.length;i++)
      {
        paths[i] = "MenteeName/StudentName/"+string[i];
      }
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
            Text("DOCUMENTS",style: GoogleFonts.aBeeZee(fontSize: 23,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
            ),
            MyTile(0),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
            ),
            MyTile(1),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
            ),
            MyTile(2),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
            ),
            MyTile(3),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
            ),
            MyTile(4),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
            ),
            MyTile(5),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
            ),
            MyTile(6),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
            ),
            MyTile(7),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
            ),
            MyTile(8),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
            ),
            MyTile(9),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
              child: Text("Once you verify all the documents we request you to please delete these files from our database to remove unnecessary burden on our system",style: GoogleFonts.aBeeZee(fontSize: 12),),
            ),
            RaisedButton(
              onPressed: (){
                for(int i=0;i<=9;i++)
                {
                  if(paths[i]==null)
                    continue;
                  FirebaseStorage.instance.ref().child(paths[i]).delete();
                }
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
                              child: Text("Documents Deleted Successfully",style: GoogleFonts.aBeeZee(fontSize: 18,color: Colors.white),),
                            ),
                          ),
                        ),
                      );
                    }
                );
              },
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text("DELETE",style: GoogleFonts.aBeeZee(fontSize: 15,color: Colors.white),),
              ),
              color: Colors.pinkAccent,
            )
          ],
        ),
      ),
    );
  }
  Widget MyTile(int index){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListTile(leading: Icon(icons[code[index]],color: colors[code[index]],),title: Text(string[index],style: GoogleFonts.aBeeZee(fontSize: 18),),trailing: Wrap(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.remove_red_eye,color: Colors.grey.shade600,),
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                        return Scaffold(
                            backgroundColor: Colors.transparent,
                            body: Center(
                              child: Expanded(
                                //Image Loading code goes here
                                child: FutureBuilder(
                                  future: _getImage(context, paths[index]),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done)
                                      return (snapshot.data==null)?Container(
                                            height: 200,
                                            width: 200,
                                            color: Colors.redAccent,
                                            child: Padding(
                                              padding: EdgeInsets.all(20),
                                              child: Column(
                                                children: <Widget>[
                                                  SizedBox(height: 30,),
                                                  Icon(Icons.warning,color: Colors.white,size: 40,),
                                                  SizedBox(height: 20,),
                                                  Text("Sorry! The Student has not uploaded this document",style: GoogleFonts.aBeeZee(fontSize: 15,color: Colors.white),)
                                                ],
                                              ),
                                            ),
                                      ):Center(
                                        child: Container(
                                          height: MediaQuery.of(context).size.height-200,
                                          width: MediaQuery.of(context).size.width-100,
                                          child: FittedBox(
                                            child: snapshot.data,
                                            fit: BoxFit.fill,
                                          )
                                        ),
                                      );
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting)
                                      return Container(
                                          height: 80,
                                          width: 80,
                                          child: CircularProgressIndicator());

                                    return Container();
                                  },
                                ),
                              ),
                            ),
                        );
                      },
                    );
            },
          ),
          IconButton(
            icon: Icon(Icons.check,color: Colors.greenAccent,),
            onPressed: (){
              setState(() {
                code[index]=1;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.clear,color: Colors.redAccent,),
            onPressed: (){
              setState(() {
                code[index]=2;
              });
            },
          )
        ],
      ),),
    );
  }
}
/*
FlatButton(
          child: Text('DELETE'),
          onPressed: (){
            FirebaseStorage.instance.ref().child(paths[0]).delete().then((_) => print('Successfully deleted storage item' ));
            setState(() {

            });
          },
        )
 */
/*
Expanded(
          //Image Loading code goes here
          child: FutureBuilder(
            future: _getImage(context, paths[0]),
            builder: (context, snapshot) {
              if (snapshot.connectionState ==
                  ConnectionState.done)
                return Container(
                  height:
                  MediaQuery.of(context).size.height / 1.25,
                  width:
                  MediaQuery.of(context).size.width / 1.25,
                  child: (snapshot.data==null)?Text('Hello'):snapshot.data,
                );

              if (snapshot.connectionState ==
                  ConnectionState.waiting)
                return Container(
                    height: MediaQuery.of(context).size.height /
                        1.25,
                    width: MediaQuery.of(context).size.width /
                        1.25,
                    child: CircularProgressIndicator());

              return Container();
            },
          ),
        ),
 */