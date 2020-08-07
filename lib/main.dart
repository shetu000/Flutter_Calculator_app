import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage( ),
    );
  }
}

class HomePage  extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage > {
  int firstnum;
  int  secondnum;
  String texttodisplay = "";
  String result;
  String operationtoperform;
  void btnclicked(String btntext){
    if(btntext=="C"){
      texttodisplay="";
      firstnum=0;
      secondnum=0;
      result="";

    }
    else if (btntext == "+"|| btntext =="-"||btntext == "x" || btntext == "/"){
      firstnum= int.parse(texttodisplay);
      result="";
      operationtoperform=btntext;

    }
    else if(btntext=="="){
      secondnum=int.parse(texttodisplay);
      if(operationtoperform=="+")
        {
          result= (firstnum + secondnum).toString();

        }
      if(operationtoperform=="-")
      {
        result= (firstnum - secondnum).toString();

      }
      if(operationtoperform=="x")
      {
        result= (firstnum * secondnum).toString();

      }
      if(operationtoperform=="/")
      {
        result= (firstnum ~/ secondnum).toString();

      }
    }
    else{
      result=int.parse(texttodisplay + btntext).toString();
    }

    setState(() {
      texttodisplay= result;
    });
  }

  Widget Custombutton(String btnvalue){
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(26.0),
        onPressed: () => btnclicked(btnvalue),
        child: Text(
          "$btnvalue",
          style: TextStyle(
            fontSize: 26.0,
          ),

        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
    appBar: AppBar(
      title: Text("Calculator"),
    ) ,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),

                alignment: Alignment.bottomRight,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            Row(
              children: <Widget>[
                Custombutton("7"),
                Custombutton("8"),
                Custombutton("9"),
                Custombutton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                Custombutton("4"),
                Custombutton("5"),
                Custombutton("6"),
                Custombutton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                Custombutton("1"),
                Custombutton("2"),
                Custombutton("3"),
                Custombutton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                Custombutton("C"),
                Custombutton("0"),
                Custombutton("="),
                Custombutton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


