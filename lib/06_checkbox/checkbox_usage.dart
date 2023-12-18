import 'package:flutter/material.dart';
import 'package:flutter_how_to_do/code_viewer/dart_file_reader.dart';

class CheckboxUsage extends StatefulWidget {
  @override
  State<CheckboxUsage> createState() => _CheckboxUsageState();
}

class _CheckboxUsageState extends State<CheckboxUsage> {
  bool checkboxControl1 = true;
  bool checkboxControl2 = true;
  String imageName = "smile.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox",),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "Checkbox", filePath: "lib/06_checkbox/checkbox_usage.dart")));
          }, child: Text("{code}",style: TextStyle(fontSize: 17),))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("images/$imageName",width: 50,height: 50,fit: BoxFit.fill,),

            //CHECKBOX -1  ***************************
            SizedBox(width: 200,
              child: CheckboxListTile(
                title: Text("Checkbox 1") ,
                controlAffinity: ListTileControlAffinity.leading, //Title location
                value: checkboxControl1,
                onChanged: (veri){ //gives
                  setState(() {
                    checkboxControl1 = veri!;
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
