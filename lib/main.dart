import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:url_audio_stream/url_audio_stream.dart';

import 'map.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isplaying = false;
  bool _ispaused = false;
  bool _value = false;
  @override
  void initState() {
    super.initState();
  }


  static AudioStream stream = new AudioStream("http://myguide.caster.fm");

  void _start()async{
    setState(() {
      _isplaying=true;
    });
    stream.start();
  }
  void _stop()async{
    setState(() {
      _isplaying=false;
    });
    stream.stop();
  }
  void _pause()async{
    setState(() {
      _ispaused=true;
    });
    stream.pause();
  }
void _resume()async{
  setState(() {
    _ispaused=false;
  });
  stream.resume();
}
void ToMap(){

}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text('Entendre votre streaming'),
            ),
            body: new Container(
                padding: new EdgeInsets.all(20.0),
                child: new Column(
                  children: [
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        new Flexible(
                          child: new Container(
                              width: 190.0,
                              height: 190.0,
                              decoration:  BoxDecoration(
                                  shape: BoxShape.circle,
                                  image:  DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage("images/audio_wave.png"))
                              )),
                        )
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          iconSize: 96.0,
                          icon: Icon(_isplaying ? Icons.stop : Icons.play_arrow),
                          onPressed: _isplaying ? _stop : _start,
                        ),
                        IconButton(
                          iconSize: 96.0,
                          icon: Icon(_ispaused ? Icons.refresh : Icons.pause),
                          onPressed: _ispaused ? _resume : _pause,
                        ),
                      ],
                    ),
                  ],)
            )
        ),
    );
  }
}