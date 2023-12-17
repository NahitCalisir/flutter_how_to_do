import 'package:flutter/material.dart';
import 'package:flutter_how_to_do/code_viewer/dart_file_reader.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {

  int radioValue = 1;
  int radioValue2 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Buttons",),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "Radio Button", filePath: "lib/7_radio_button/radio_button.dart")));
          }, child: Text("{code}",style: TextStyle(fontSize: 17),))
        ],
      ),
      body: Center(
        child: Column(
          children: [

            //RADIO BUTTONS   ***************************
            SizedBox(width: 200,
              child: RadioListTile(
                groupValue: radioValue,
                value: 1,
                title: Text("Radio 1 title"),
                subtitle: Text("Radio 1 Subtitle"),
                //activeColor: Colors.red,
                //controlAffinity: ListTileControlAffinity.leading,
                onChanged: (val){ //gives
                  print("Radio Tile pressed $val");
                  setState(() {
                    radioValue = val!;
                  });// state of
                }),
            ),
            SizedBox(width: 200,
              child: RadioListTile(
                  groupValue: radioValue,
                  value: 2,
                  title: Text("Radio 2 title"),
                  subtitle: Text("Radio 2 Subtitle"),
                  //activeColor: Colors.red,
                  //controlAffinity: ListTileControlAffinity.leading,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (val){ //
                    print("Radio Tile pressed $val");// gives
                    setState(() {
                      radioValue = val!;
                    });// state of
                  }),
            ),
            SizedBox(width: 200,
              child: RadioListTile(
                  groupValue: radioValue,
                  value: 3,
                  title: Text("Radio 3 title"),
                  subtitle: Text("Radio 3 Subtitle"),
                  //activeColor: Colors.red,
                  //controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (val){
                    print("Radio Tile pressed $val");//gives
                    setState(() {
                      radioValue = val!;
                    });// state of
                  }),
            ),
            // This goes to the build method

            //RADIO BUTTONS WITH SECONDARY ITEM   ******************************
            RadioListTile(
              value: 1,
              groupValue: radioValue2,
              title: Text("Radio 1"),
              subtitle: Text("Radio 1 Subtitle"),
              selected: false,
              activeColor: Colors.blue,
              onChanged: (val) {
                print("Radio Tile pressed $val");
                setState(() {
                  radioValue2 = val!;
                });
              },
              secondary: ElevatedButton(
                child: Text("Say Hi"),
                onPressed: () {
                  print("Say Hello");
                },
              ),
            ),
            RadioListTile(
              value: 2,
              groupValue: radioValue2,
              title: Text("Radio 2"),
              subtitle: Text("Radio 2 Subtitle"),
              selected: true,
              activeColor: Colors.blue,
              onChanged: (val) {
                print("Radio Tile pressed $val");
                setState(() {
                  radioValue2 = val!;
                });
              },
              secondary: ElevatedButton(
                child: Text("Say Hi"),
                onPressed: () {
                  print("Say Hello");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

