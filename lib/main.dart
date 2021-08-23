import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child:Column(
        
      children: [
        Container(
          margin: const EdgeInsets.only(top: 300, bottom: 5),
            color: Colors.white,
            child: new Image.asset(
              'images/uno.png',
              height: 150,
            )),
          Text(
                    "Welcome",
                    style: TextStyle(color: Colors.black, fontSize: 30)),
      ],)
    ) );
    
  }
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController distanceKm = new TextEditingController();
  TextEditingController essenceConsome = new TextEditingController();
  TextEditingController essencePrix = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 180,
          shadowColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40, bottom: 10),
                    child: Image.asset(
                      'images/uno.png',
                      width: 150,
                    ),
                  ),
                  Text(
                    "UNO consomation",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  )
                ],
              )
            ],
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              margin: const EdgeInsets.only(bottom: 30),
              child: TextField(
                controller: distanceKm,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Distance en KM'),
              ),
            ),
            Container(
              width: 250,
              margin: const EdgeInsets.only(bottom: 30),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: essenceConsome,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Essnece consomé en DH"),
              ),
            ),
            Container(
              width: 250,
              child: TextField(
                controller: essencePrix,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Prix d'essence en DH"),
              ),
            ),
            Builder(
              builder: (context) => Container(
                height: 50.0,
                margin: const EdgeInsets.only(top: 30),
                child: RaisedButton(
                  onPressed: () {
                    if (distanceKm.text == "" ||
                        essenceConsome.text == "" ||
                        essencePrix.text == "") {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Une valeur n'est pas saisie"),
                        backgroundColor: Colors.redAccent,
                      ));
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                content: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              //position
                              mainAxisSize: MainAxisSize.min,
                              // wrap content in flutter
                              children: <Widget>[
                                Text("Consomation L/Km : " +
                                    ((double.parse(essenceConsome.text) *
                                                double.parse(
                                                    essencePrix.text)) /
                                            double.parse(distanceKm.text))
                                        .toStringAsFixed(2)),
                                Text("Consomation L : " +
                                    (double.parse(essenceConsome.text) /
                                            double.parse(essencePrix.text))
                                        .toStringAsFixed(2)),
                              ],
                            ));
                          });
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Calculer",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        )));
  }
}
