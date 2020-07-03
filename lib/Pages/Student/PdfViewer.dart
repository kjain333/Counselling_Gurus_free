

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
class PdfViewer1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PdfViewer();
  }

}
int c=0;
class _PdfViewer extends State<PdfViewer1>{
  bool _isLoading=false,_isInit=true;
  PDFDocument document;
  @override
  void dispose() {
    super.dispose();
    c=0;
  }
  @override
  Widget build(BuildContext context) {
    if(c==0)
      loadFromAssets();
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[

            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: _isInit?
                  Text('Press button to load PDF file')
                      :_isLoading
                      ?
                  Center(
                    child: CircularProgressIndicator(),
                  ):PDFViewer(
                    document: document,

                  )
              ),
            ),

          ],
        ),
      ),
    );
  }
  loadFromAssets() async{
    setState(() {
      _isInit = false;
      _isLoading = true;
      c=1;
    });
    document = await PDFDocument.fromURL('https://docs.google.com/presentation/d/1mSrWMefaIkErR6pG5w42JgDMn_8K4S6CE1QnU0QQWeY/export/pdf');
    setState(() {
      _isLoading = false;
    });
  }
}