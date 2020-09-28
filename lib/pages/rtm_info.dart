import 'package:corona_care_ai/pages/list_services.dart';

import 'rtm.dart';
import 'package:flutter/material.dart';

class RTMInfo extends StatefulWidget {
  @override
  _RTMInfoState createState() => _RTMInfoState();
}

class _RTMInfoState extends State<RTMInfo> {
  final _channelNameController = TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 1, 25, 1),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 50,left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Online', style: TextStyle(color: Color.fromRGBO(255, 208, 50, 1), fontSize: 40, fontWeight: FontWeight.bold),),
                      Text('Consultation', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 35, fontWeight: FontWeight.bold),), 
                      Padding(padding: EdgeInsets.symmetric(vertical: 1)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text('Talk to your doctor online through ', style: TextStyle(color: Colors.white70), ),
                            Text('Agora', style: TextStyle(color: Color.fromRGBO(255, 208, 50, 1))),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(140))
                ),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width * 0.65,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(248, 248, 248, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Let\'s Connect", style: TextStyle(color: Color.fromRGBO(227, 111, 123, 1), fontSize: 20, fontWeight: FontWeight.bold),),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextFormField(
                            controller: _channelNameController,
                            decoration: InputDecoration(
                              hintText: 'test',
                              hintStyle: TextStyle(color: Colors.black54),
                              labelText: 'Doctor\'s Name',
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(227, 111, 123, 1),
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(227, 111, 123, 1),
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(227, 111, 123, 1),
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            )
                          ),
                        ),
                        Container(
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Color.fromRGBO(227, 111, 123, 1),
                                  width: 5
                                ),
                                color: Color.fromRGBO(0, 1, 25, 1)
                              ),
                              child: MaterialButton(
                                onPressed: onJoin,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Join', style: TextStyle(color: Colors.white),),
                                    Icon(Icons.arrow_right, color: Colors.white,),
                                  ],
                                ),
                              ),
                            ),
                      ],
                    ),
                  ),
                ),
              )
              )
          ],
        )
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(icon: Icon(Icons.shopping_cart, color: Colors.black,), onPressed: (){}),
            IconButton(icon: Icon(Icons.home, color: Colors.black,), onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => ListServices()
                )
              );
            }),
            IconButton(icon: Icon(Icons.account_circle, color: Colors.black,), onPressed: (){}),
          ],
        ),
      )
    );
  }
  Future<void> onJoin() async {
    // update input validation
    
    if (_channelNameController.text.isNotEmpty) {
      
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RealTimeMessaging(_channelNameController.text),
        ),
      );
    }
  }
}