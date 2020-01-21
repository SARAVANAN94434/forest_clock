import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _timeString = '', _timeSec = '', _am_pm = '';
  int _angle = 0;
  AssetImage bg_image, bg_top;

  @override
  void initState() {
    bg_image = new AssetImage('images/day_bg.png');
    bg_top = new AssetImage('images/clouds.png');
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/day_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: bg_image,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // clouds / stars
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: bg_top,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // sun
          Transform.rotate(
              angle: _angle.toDouble() * 3.14 / 180.0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image(
                  image: AssetImage('images/sun.png'),
                  width: 50,
                  height: 50,
                ),
              ),
          ),

          // moon
          Transform.rotate(
            angle: _angle.toDouble() * 3.14 / 180.0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Image(
                image: AssetImage('images/moon.png'),
                width: 50,
                height: 50,
              ),
            ),
          ),

          // bg2
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg_2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // clock
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                    Text(_timeString, style: TextStyle(fontFamily: 'Digital-7', fontSize: 100,color: Color.fromARGB(255, 230, 126, 34)),),

                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                    Text(_am_pm, style: TextStyle(fontFamily: 'Digital-7', fontSize: 35, color: Color.fromARGB(255, 230, 126, 34)),),
                    Text(_timeSec, style: TextStyle(fontFamily: 'Digital-7', fontSize: 60, color: Color.fromARGB(255, 230, 126, 34)),),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // bg1
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg_1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

        ],
      ),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();

    setState(() {
     _timeString = "${DateFormat('hh:mm').format(now)}";
     _timeSec = "${DateFormat('ss').format(now)}";

     int _hr = DateTime.now().hour.toInt();

     _angle = _hr * 15;

      if(_hr > 12)
        {
          _am_pm = 'PM';
        }
      else
        {
          _am_pm = 'AM';
        }

      if(_hr > 5 && _hr < 18)
        {
          bg_image = new AssetImage('images/day_bg.png');
          bg_top = new AssetImage('images/clouds.png');
        }
      else
        {
          bg_image = new AssetImage('images/night_bg.png');
          bg_top = new AssetImage('images/stars.png');
        }
    });
  }
}




