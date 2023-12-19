import 'package:flutter/material.dart';
import 'package:flutter_how_to_do/code_viewer/dart_file_reader.dart';

class GestureDedectorUsage extends StatefulWidget {
  const GestureDedectorUsage({super.key});

  @override
  State<GestureDedectorUsage> createState() => _GestureDedectorUsageState();
}

class _GestureDedectorUsageState extends State<GestureDedectorUsage> {

  String gestureType = "Gesture Type";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drop Down Menu",),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "Gesture Detector", filePath: "lib/12_gesture_dedector/gesture_dedector_usage.dart")));
          }, child: const Text("{code}",style: TextStyle(fontSize: 17),))
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Text(gestureType),

            //DROP DOWN MENU ********************
            GestureDetector(
                onTap:(){setState((){
                  gestureType = "Gesture Type:onTap";});},
                onTapCancel:(){setState((){
                  gestureType = "Gesture Type:onTapCancel";});},
                onSecondaryTap:(){setState((){
                  gestureType = "Gesture Type:onSecondaryTap";});},
                onSecondaryTapCancel:(){setState((){
                  gestureType = "Gesture Type:onSecondaryTapCancel";});},
                onTertiaryTapCancel:(){setState((){
                  gestureType = "Gesture Type:onTertiaryTapCancel";});},
                onDoubleTap:(){setState((){
                  gestureType = "Gesture Type:onDoubleTap";});},
                onDoubleTapCancel:(){setState((){
                  gestureType = "Gesture Type:onDoubleTapCancel";});},
                onLongPressCancel:(){setState((){
                  gestureType = "Gesture Type:onLongPressCancel";});},
                onLongPress:(){setState((){
                  gestureType = "Gesture Type:onLongPress";});},
                onLongPressUp:(){setState((){
                  gestureType = "Gesture Type:onLongPressUp";});},
                onSecondaryLongPressCancel:(){setState((){
                  gestureType = "Gesture Type:onSecondaryLongPressCancel";});},
                child: Container(width: 300,height: 300,color: Colors.teal,
                  child: Center(child: Text("Touch Pad")),)),
          ],
        ),
      ),
    );
  }
}
