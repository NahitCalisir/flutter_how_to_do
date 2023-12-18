import 'package:flutter/material.dart';
import 'package:flutter_how_to_do/code_viewer/dart_file_reader.dart';

class ScrollViewUsage extends StatefulWidget {
  const ScrollViewUsage({super.key});

  @override
  State<ScrollViewUsage> createState() => _ScrollViewUsageState();
}

class _ScrollViewUsageState extends State<ScrollViewUsage> {

  String gestureType = "Gesture Type";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drop Down Menu",),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "Scroll View", filePath: "lib/13_scroll_view/scroll_view_usage.dart")));
          }, child: const Text("{code}",style: TextStyle(fontSize: 17),))
        ],
      ),
      body:
        SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(width: 300,height: 300,color: Colors.red,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(width: 300,height: 300,color: Colors.red,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(width: 300,height: 300,color: Colors.red,),
                    ),
                  ],
                ),
              ),
          
              SizedBox(height: 250,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(width: 400,height: 200,color: Colors.indigo,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(width: 400,height: 200,color: Colors.indigo,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(width: 400,height: 200,color: Colors.indigo,),
                      ),
                    ],
                  ),
                ),
              ),
          
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(width: 300,height: 300,color: Colors.green,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(width: 300,height: 300,color: Colors.green,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(width: 300,height: 300,color: Colors.green,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),


    );
  }
}
