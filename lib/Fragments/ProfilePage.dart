import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => new _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Colors.black87.withOpacity(0.9)),
          clipper: GetClipper(),
        ),
        Positioned(
            width: MediaQuery.of(context).size.width / 1,
            top: MediaQuery.of(context).size.height / 16,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: new BoxDecoration(
                        color: Colors.black87,
                        image: DecorationImage(
                            image:
                                new AssetImage('assets/images/splashpic.png')),
                        /*image: DecorationImage(
                            image: NetworkImage(
                                'Any .jpg file URL'),
                            fit: BoxFit.cover),
                        */
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ])),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'VarSVat',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    IconButton(icon: Icon(Icons.edit), onPressed: () {})
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'I Am A Student ',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(width: 40),
                    IconButton(icon: Icon(Icons.edit), onPressed: () {})
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'IIT-JEE Stream',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(width: 40),
                    IconButton(icon: Icon(Icons.edit), onPressed: () {})
                  ],
                ),
                Card(
                    color: Colors.white,
                    borderOnForeground: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.phone,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '123456XXXX',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    )),
                Card(
                    color: Colors.white,
                    borderOnForeground: true,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Gender',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    )),
                Card(
                    color: Colors.white,
                    borderOnForeground: true,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.mail,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'varun@xyz.com',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    )),
                SizedBox(height: 20.0),
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.redAccent,
                      color: Colors.red[800],
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Log out',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.exit_to_app,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ))
              ],
            ))
      ],
    ));
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 50, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
