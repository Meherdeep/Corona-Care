import '../utils/app_id.dart';
import 'package:flutter/material.dart';
import 'package:agora_rtm/agora_rtm.dart';

class RealTimeMessaging extends StatefulWidget {
  final String channelName;
  RealTimeMessaging(this.channelName);
  @override
  _RealTimeMessagingState createState() => _RealTimeMessagingState();
}

class _RealTimeMessagingState extends State<RealTimeMessaging> {
  bool _isLogin = false;
  bool _isInChannel = false;

  final _channelMessageController = TextEditingController();

  final _infoStrings = <String>[];

  AgoraRtmClient _client;
  AgoraRtmChannel _channel;
  

  @override
  void initState() {
    super.initState();
    _createClient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 1, 25, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Color.fromRGBO(255, 208, 50, 1),
            child: Icon(Icons.healing, color: Colors.black,),
          ),
        ),
        title: Text('Dr. '+widget.channelName, style: TextStyle(color: Colors.black),),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
              child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            )
          ),
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
              child: Column(
                children: [
                  // _buildPeerInfoList(),
                  _buildInfoList(),
                  _buildSendChannelMessage(),
                  
                ],
              ),
            ),
          )
      // body: Container(
      //     height: MediaQuery.of(context).size.height * 0.3,
      //     decoration: BoxDecoration(
      //       color: Color.fromRGBO(255, 255, 255, 0),
      //       borderRadius: BorderRadius.only(
      //       topRight: Radius.circular(40),
      //       topLeft: Radius.circular(40),
      //       )
      //     ),
      //     padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
      //     child: Column(
      //             children: [
      //               _buildInfoList(),
      //               _buildSendChannelMessage(), 
      //             ],
      //           ),
      //     ),
    );
    
  }

  void _createClient() async {
    _client = await AgoraRtmClient.createInstance(APP_ID);
    _client.onMessageReceived = (AgoraRtmMessage message, String peerId) {
      _logPeer("Peer msg: " + peerId + ", msg: " + message.text);
    };
    _client.onConnectionStateChanged = (int state, int reason) {
      print('Connection state changed: ' +
          state.toString() +
          ', reason: ' +
          reason.toString());
      if (state == 5) {
        _client.logout();
        print('Logout.');
        setState(() {
          _isLogin = false;
        });
      }
    };

    String userId = widget.channelName+"123";
    await _client.login(null, userId);
        print('Login success: ' + userId);
        setState(() {
          _isLogin = true;
    });
    String channelName = widget.channelName;
    _channel = await _createChannel(channelName);
        await _channel.join();
        print('Join channel success.');
        setState(() {
          _isInChannel = true;
        });

  }

  Future<AgoraRtmChannel> _createChannel(String name) async {
    AgoraRtmChannel channel = await _client.createChannel(name);
    channel.onMemberJoined = (AgoraRtmMember member) {
      print(
          "Member joined: " + member.userId + ', channel: ' + member.channelId);
    };
    channel.onMemberLeft = (AgoraRtmMember member) {
      print("Member left: " + member.userId + ', channel: ' + member.channelId);
    };
    channel.onMessageReceived =
        (AgoraRtmMessage message, AgoraRtmMember member) {
      _logPeer(message.text);
    };
    return channel;
  }

  static TextStyle textStyle = TextStyle(fontSize: 18, color: Colors.blue);

  

  Widget _buildSendChannelMessage() {
    if (!_isLogin || !_isInChannel) {
      return Container();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width *0.75,
                      child: TextFormField(
                        controller: _channelMessageController,
                        decoration: InputDecoration(
                          hintText: 'Comment...',
                          hintStyle: TextStyle(color: Colors.black54),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.black87, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.black87, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.black87, width: 2),
                          ), 
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(
                          color: Colors.black87, 
                          width: 2,
                        )
                      ),
                      child: IconButton(
                        icon: Icon(Icons.send, color: Colors.black54, size: 30,), 
                        onPressed: _toggleSendChannelMessage, 
                      ),
                    )
                  ],
                );
  }
  
  Widget buildState(){
    return Container();
  }

  Widget _buildInfoList() {
    return Expanded(
        child: Container(
          child: _infoStrings.length>0 ? ListView.builder(  
            reverse: true,
            itemBuilder: (context, i) {
              return Container(
                child: ListTile(
                  title: Align(
                    alignment: _infoStrings[i].startsWith('%') ? Alignment.bottomLeft:Alignment.bottomRight,
                      child: Column(
                        crossAxisAlignment: _infoStrings[i].startsWith('%') ? CrossAxisAlignment.start:  CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2 ),
                            color: _infoStrings[i].startsWith('%') ? Color(0xFFDCDCDC) : Color(0xFF3A97DC),
                            child: _infoStrings[i].startsWith('%') ? Text(_infoStrings[i].substring(1), maxLines: 10, overflow: TextOverflow.ellipsis,textAlign: TextAlign.right,style: TextStyle(color: Colors.black),): Text(_infoStrings[i], maxLines: 10, overflow: TextOverflow.ellipsis,textAlign: TextAlign.right,style: TextStyle(color: Colors.white),)
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          _infoStrings[i].startsWith('%') ? Text('Dr. '+ widget.channelName, style: TextStyle(color: Colors.grey, fontSize: 12),) : Text('You' , style: TextStyle(color: Colors.grey, fontSize: 12 ),)
                        ],
                      ),
                    ),
                  ),
                );
              },
          itemCount: _infoStrings.length,
        ):Container()
      )
    );
  }


  void _toggleSendChannelMessage() async {
    String text = _channelMessageController.text;
    if (text.isEmpty) {
      print('Please input text to send.');
      return;
    }
    try {
      
      await _channel.sendMessage(AgoraRtmMessage.fromText(text));
      _log(text);
      _channelMessageController.clear();
    } catch (errorCode) {
      print('Send channel message error: ' + errorCode.toString());
    }
  }

  void _logPeer(String info){
    info = '%'+info;
    print(info);
    setState(() {
      _infoStrings.insert(0,info);
    });
    
  }
  void _log(String info) {
    print(info);
    setState(() {
      _infoStrings.insert(0,info);
    });
  }
}