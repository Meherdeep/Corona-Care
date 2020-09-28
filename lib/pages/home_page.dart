import 'list_services.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 2, 5, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/logo.png'),
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 20),
          //   child: Stack(
          //   alignment: AlignmentDirectional.center,
          //   children: <Widget>[
          //     CircleAvatar(
          //       radius: MediaQuery.of(context).size.width * 0.46,
          //       backgroundColor: Color.fromRGBO(21, 3, 25, 1),
          //     ),
          //     CircleAvatar(
          //       radius: MediaQuery.of(context).size.width * 0.4,
          //       backgroundColor: Color.fromRGBO(26, 12, 31, 1),
          //     ),
          //     CircleAvatar(
          //       radius: MediaQuery.of(context).size.width * 0.36,
          //       backgroundColor: Color.fromRGBO(30, 16, 36, 1),
          //     ),
          //     Text('Corona care', style: TextStyle(color: Color.fromRGBO(255, 208, 50, 1), fontSize: 40, fontWeight: FontWeight.bold),),
          //     //Text('Care ', style: TextStyle(color: Color.fromRGBO(255, 208, 50, 1), fontSize: 40, fontWeight: FontWeight.bold),)

          //   ],
          // )
          // ),
          Padding(padding: EdgeInsets.only(top: 40)),
          Container(
            width: MediaQuery.of(context).size.width * 0.86,
            height: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Coronavirus', style: TextStyle(color: Color.fromRGBO(255, 208, 50, 1),fontWeight: FontWeight.bold, fontSize: 18),),
                Text('The world is pretty topsy-turvy right now, because of coronavirus. If you’re feeling overwhelmed or stressed by it all, this is your platform to get all help you need', style: TextStyle(color: Color.fromRGBO(191, 191, 192, 1)),),
              ],
            ), 
          ),
          Container(
            padding: EdgeInsets.only(top: 50),
            child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.1,
                backgroundColor: Color.fromRGBO(27, 9, 28, 1),
              ),
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.08,
                backgroundColor: Color.fromRGBO(227, 0, 26, 1),
                child: IconButton(icon: Icon(Icons.arrow_forward, color: Colors.white,), onPressed: onJoin),
              )
            ],
          ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('#StayHome', style: TextStyle(color: Colors.white),),
              Text('StaySafe',style: TextStyle(color: Color.fromRGBO(255, 208, 50, 1)),)
            ],
          )
        ],
      )
    );
  }
  Future<void> onJoin() async {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListServices(),
        ),
      );
    
  }
}