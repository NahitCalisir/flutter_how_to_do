import 'package:flutter/material.dart';
import 'package:flutter_how_to_do/code_viewer/dart_file_reader.dart';

class SwitchUsage extends StatefulWidget {
  @override
  State<SwitchUsage> createState() => _SwitchUsageState();
}

class _SwitchUsageState extends State<SwitchUsage> {
  bool switchControl = true;
  String imageName = "smile.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch",),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "Switch", filePath: "lib/05_switch/switch_usage.dart")));
          }, child: Text("{code}",style: TextStyle(fontSize: 17),))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("images/$imageName",width: 50,height: 50,fit: BoxFit.fill,),
            SizedBox(width: 200,

              //SWİTCH ***************************
              child: SwitchListTile(
                title: Text("Switch") ,
                controlAffinity: ListTileControlAffinity.trailing, //Title location
                value: switchControl,
                onChanged: (veri){ //gives
                  setState(() {
                    switchControl = veri;
                    (veri) ? imageName = "smile.png": imageName = "bad.png";
                  });// state of
                }),
            ),
          ],
        ),
      ),
    );
  }
}
