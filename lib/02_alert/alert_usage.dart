import 'package:flutter/material.dart';
import 'package:flutter_how_to_do/code_viewer/dart_file_reader.dart';

class AlertUsage extends StatefulWidget {
  const AlertUsage({super.key});

  @override
  State<AlertUsage> createState() => _AlertUsageState();
}

class _AlertUsageState extends State<AlertUsage> {

  var tfControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert",),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "Alert",filePath: "lib/02_alert/alert_usage.dart")));
          }, child: const Text("{code}",style: TextStyle(fontSize: 17),))
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: const Text("TITLE"),
                      backgroundColor: Colors.yellow.shade100,
                      content: Column(mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Message content"),
                          TextField(
                            controller: tfControl,
                            decoration: const InputDecoration(hintText: "Hint Text",hintStyle: TextStyle()),
                          )
                        ],
                      ),
                      actions: [
                        TextButton(onPressed: (){
                          print("OK Clicked");
                          Navigator.pop(context);
                        }, child: const Text("OK")),
                        TextButton(onPressed: (){
                          print("Cancel Clicked");
                          Navigator.pop(context);
                        }, child: const Text("Cancel")),
                      ],
                    );
                  }
              );
            }, child: const Text("Alert")),
          ],
        ),
      ),
    );
  }
}
