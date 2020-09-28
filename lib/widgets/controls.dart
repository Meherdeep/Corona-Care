import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ControlBar extends StatefulWidget {
  @override
  _ControlBarState createState() => _ControlBarState();
}

class _ControlBarState extends State<ControlBar> {
  bool micStatus = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
                      child: IconButton(
                icon: Icon(Icons.switch_camera, color: Colors.black,), 
                onPressed: toggleCamera,

              ),
          ),
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.red,
                      child: IconButton(
                icon: Icon(Icons.call_end, color: Colors.white,), 
                onPressed: disconnectCall,
              ),
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
                      child: IconButton(
                icon: micStatus ? Icon(Icons.mic_off, color: Colors.black,) : Icon(Icons.mic, color: Colors.black) , 
                onPressed: toggleMute,
              ),
          ),   

        ],
      ),
      
    );
  }
  void toggleMute(){
    setState(() {
      micStatus = !micStatus;
    });
    AgoraRtcEngine.muteLocalAudioStream(micStatus);
  }
  void toggleCamera(){
    AgoraRtcEngine.switchCamera();
  }
  void disconnectCall(){
    Navigator.pop(context);
  }
}
