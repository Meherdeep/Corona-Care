import 'package:carousel_slider/carousel_slider.dart';
import 'package:corona_care_ai/pages/store_locator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'rtm_info.dart';
import 'package:flutter/material.dart';
import 'video_call_info.dart';

class ListServices extends StatefulWidget {
  @override
  _ListServicesState createState() => _ListServicesState();
}

class _ListServicesState extends State<ListServices> {
  List<String> headerName = ['Medical Assistance','Food             Delivery','Video               Calling'];
  List<String> line1 = ['Talk to our ','Your ','Shortening the distance - '];
  List<String> line2 = ['superheroes ','hunger ', 'Agora '];
  List<String> line3 = ['online ','partner ',''];
  List<String> imagePath = ['assets/doc.png','assets/groceries.png','assets/video_call.png'];
  List<String> btnText = ['Consultation','Order Now','Let\'s Connect'];
  List<Color> colorScheme = [Color.fromRGBO(248, 103, 79, 1),Color.fromRGBO(255, 208, 50, 1),Color.fromRGBO(248, 103, 79, 1)];
  List<Color> textColorScheme = [Color.fromRGBO(255, 208, 50, 1), Color.fromRGBO(248, 103, 79, 1),Color.fromRGBO(255, 208, 50, 1)];
  
  
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
                      Text('Corona', style: TextStyle(color: Color.fromRGBO(255, 208, 50, 1), fontSize: 40, fontWeight: FontWeight.bold),),
                      Text('Care', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 35, fontWeight: FontWeight.bold),), 
                      Padding(padding: EdgeInsets.symmetric(vertical: 1)),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: <Widget>[
                            Text('Let\'s fight ', style: TextStyle(color: Colors.white70), ),
                            Text('together', style: TextStyle(color: Color.fromRGBO(255, 208, 50, 1))),
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
              child: Image.asset('assets/lower.png', width: MediaQuery.of(context).size.width *1.008,fit: BoxFit.fitWidth),
            ),
            Positioned(
              bottom: 40,
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.8,
              left: MediaQuery.of(context).size.width * 0.15,
              child: CarouselSlider.builder(
                itemCount: 3, 
                itemBuilder: (ctx, index){
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: colorScheme[index],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 8),
                          child:Column(
                            children: <Widget>[
                              Text(headerName[index], style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 30, fontWeight: FontWeight.bold),),
                              Row(
                                children: <Widget>[
                                  Text(line1[index], style: TextStyle(color: Colors.white70),),
                                  Text(line2[index],style: TextStyle(color: textColorScheme[index], fontWeight: FontWeight.bold)),
                                  Text(line3[index], style: TextStyle(color: Colors.white70),)
                                ],
                              ),
                            ],
                          )
                        ),
                        
                        Center(
                          child: Image.asset(imagePath[index], scale: 1.9,),
                        ),
                            Container(
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Color.fromRGBO(227, 111, 123, 1),
                                  width: 5
                                ),
                                color: Color.fromRGBO(0, 1, 25, 1)
                              ),
                              child: MaterialButton(
                                onPressed: (){functionAssignment(index);},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(btnText[index], style: TextStyle(color: Colors.white),),
                                    Icon(Icons.arrow_right, color: Colors.white,),
                                  ],
                                ),
                              ),
                            ),
                      ],  
                    ),
                  );
                }, 
                options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: false,
                  aspectRatio: 5,
                  enableInfiniteScroll: false,
                  height: MediaQuery.of(context).size.height * 0.6,
                  enlargeCenterPage: true,
                  scrollPhysics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                )
              ),
              // child: ListView(
              //   scrollDirection: Axis.horizontal,
              //   children: <Widget>[
              //     Container(
              //       width: MediaQuery.of(context).size.width * 0.7,
              //       decoration: BoxDecoration(
              //         color: Color.fromRGBO(248, 103, 79, 1),
              //       ),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //         children: <Widget>[
              //           Container(
              //             padding: EdgeInsets.only(left: 8),
              //             child:Column(
              //               children: <Widget>[
              //                 Text('Medical Assistance', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 30, fontWeight: FontWeight.bold),),
              //                 Row(
              //                   children: <Widget>[
              //                     Text('Talk to our ', style: TextStyle(color: Colors.white70),),
              //                     Text('superheroes ',style: TextStyle(color: Color.fromRGBO(255, 208, 50, 1), fontWeight: FontWeight.bold)),
              //                     Text('online', style: TextStyle(color: Colors.white70),)
              //                   ],
              //                 ),
              //               ],
              //             )
              //           ),
                        
              //           Center(
              //             child: Image.asset('assets/doc.png', scale: 1.9,),
              //           ),
              //               Container(
              //                 width: 160,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(20),
              //                   border: Border.all(
              //                     color: Color.fromRGBO(227, 111, 123, 1),
              //                     width: 5
              //                   ),
              //                   color: Color.fromRGBO(0, 1, 25, 1)
              //                 ),
              //                 child: MaterialButton(
              //                   onPressed: onJoinRealTimeMessaging,
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                     children: <Widget>[
              //                       Text('Consultation', style: TextStyle(color: Colors.white),),
              //                       Icon(Icons.arrow_right, color: Colors.white,),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //         ],  
              //       ),
              //     ),
              //     Container(
              //       width: MediaQuery.of(context).size.width * 0.7,
              //       decoration: BoxDecoration(
              //         color: Color.fromRGBO(255, 208, 50, 1),
              //       ),
                    
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //         children: <Widget>[
              //           Container(
              //             padding: EdgeInsets.only(left: 8),
              //             child:Column(
              //               children: <Widget>[
              //                 Text('Food             Delivery', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 30, fontWeight: FontWeight.bold),),
              //                 Row(
              //                   children: <Widget>[
              //                     Text('Your ', style: TextStyle(color: Colors.white70),),
              //                     Text('hunger ',style: TextStyle(color: Color.fromRGBO(248, 103, 79, 1), fontWeight: FontWeight.bold)),
              //                     Text('partner', style: TextStyle(color: Colors.white70),)
              //                   ],
              //                 ),
              //               ],
              //             )
              //           ),
              //           Center(
              //             child: Image.asset('assets/groceries.png', scale: 2,),
              //           ),
              //               Container(
              //                 width: 160,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(20),
              //                   border: Border.all(
              //                     color: Color.fromRGBO(227, 111, 123, 1),
              //                     width: 5
              //                   ),
              //                   color: Color.fromRGBO(0, 1, 25, 1)
              //                 ),
              //                 child: MaterialButton(
              //                   onPressed: (){},
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                     children: <Widget>[
              //                       Text('Order Now', style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
              //                       Icon(Icons.arrow_right, color: Colors.white,),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //         ],  
              //       ),
              //     ),
              //     Container(
              //       width: MediaQuery.of(context).size.width * 0.7,
              //       decoration: BoxDecoration(
              //         color: Color.fromRGBO(248, 103, 79, 1),
              //       ),
                    
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //         children: <Widget>[
              //           Container(
              //             padding: EdgeInsets.only(left: 8),
              //             child:Column(
              //               children: <Widget>[
              //                 Text('Video               Calling', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 30, fontWeight: FontWeight.bold),),
              //                 Row(
              //                   children: <Widget>[
              //                     Text('Shortening the distance - ', style: TextStyle(color: Colors.white70),),
              //                     Text('Agora ',style: TextStyle(color: Color.fromRGBO(255, 208, 50, 1), fontWeight: FontWeight.bold)),
              //                   ],
              //                 ),
              //               ],
              //             )
              //           ),
              //           Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              //           Center(
              //             child: Image.asset('assets/video_call.png', scale: 1.9,),
              //           ),
              //           Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
              //               Container(
              //                 width: 160,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(20),
              //                   border: Border.all(
              //                     color: Color.fromRGBO(227, 111, 123, 1),
              //                     width: 5
              //                   ),
              //                   color: Color.fromRGBO(0, 1, 25, 1)
              //                 ),
              //                 child: MaterialButton(
              //                   onPressed: onJoinVideoCalling,
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                     children: <Widget>[
              //                       Text('Let\'s Connect', style: TextStyle(color: Colors.white),),
              //                       Icon(Icons.arrow_right, color: Colors.white,),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //         ],  
              //       ),
              //     ),
              //   ],
              // )
            ),
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
  Future<void> functionAssignment(int index) async{
    if (index == 0) {
      onJoinRealTimeMessaging();
    }
    else if(index == 1){
      viewStores();
    }
    else if(index == 2){
      onJoinVideoCalling();
    } 
  }

  Future<void> onJoinVideoCalling() async {

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoCallInfo(),
        ),
      );
    
  }
  Future<void> onJoinRealTimeMessaging() async {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RTMInfo(),
        ),
      ); 
  }

  Future<void> viewStores() async {
    await _handleLocationPermission();
    await Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => StoreLocator()
      )
    );
  }

  Future<void> _handleLocationPermission() async{
    final status = await Permission.location.request();
    print(status);
  }
}
