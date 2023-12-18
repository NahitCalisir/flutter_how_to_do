import 'package:flutter/material.dart';
import 'package:flutter_how_to_do/code_viewer/dart_file_reader.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {

  bool progressBarIsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Progress Bar",),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "Progress Bar", filePath: "lib/08_progress_bar/progress_bar.dart")));
          }, child: Text("{code}",style: TextStyle(fontSize: 17),))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //PROGRESS BAR
                  Visibility(visible: progressBarIsVisible,child: CircularProgressIndicator()),

                  Visibility(
                    visible: progressBarIsVisible,
                    child: CircularProgressIndicator(
                      color: Colors.indigo.shade700,
                      backgroundColor: Colors.yellow,
                      semanticsLabel: "label",
                      semanticsValue: "value",
                      strokeWidth: 20,
                      strokeAlign: 2,
                      strokeCap: StrokeCap.round,
                      //value: 0.5,
                    ),
                  ),

                  Stack(alignment: AlignmentDirectional.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.red,
                        backgroundColor: Colors.grey.shade300,
                        semanticsLabel: "label",
                        semanticsValue: "value",
                        strokeWidth: 15,
                        strokeAlign: 3,
                        strokeCap: StrokeCap.round,
                        value: 0.60,
                      ),

                      Text("%75",style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      progressBarIsVisible = true;
                    });
                  }, child: const Text("Start")),

                  ElevatedButton(onPressed: (){
                    setState(() {
                      progressBarIsVisible = false;
                    });
                  }, child: const Text("Stop")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
