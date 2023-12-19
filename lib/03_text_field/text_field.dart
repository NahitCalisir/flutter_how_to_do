import 'package:flutter/material.dart';
import '../code_viewer/dart_file_reader.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {

  final tfController = TextEditingController();
  final tfDesignController = TextEditingController();
  String inputText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Fields",),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "Text Field", filePath: "lib/03_text_field/text_field.dart")));
          }, child: Text("{code}",style: TextStyle(fontSize: 17),))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Input Text: $inputText"),
              //My custom fields are created below
              MyBasicTextField(fieldName: "Basic Text Field", myController: tfController),
              MyCustomTextField(fieldName: "Custom Text Field", myController: tfController),
              MyCustomTextFormField(fieldName: "Custom Text Form Field", myController: tfController),

              ElevatedButton(onPressed: (){
                setState(() {
                  inputText = tfController.text;
                });
              }, child: Text("Get Input Text"))
            ],
          ),
        ),
      ),
    );
  }
}

class  MyBasicTextField extends StatelessWidget {
  MyBasicTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.orange,
  });
  final TextEditingController myController;
  String fieldName;
  final IconData myIcon;
  Color prefixIconColor;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          prefixIcon: Icon(myIcon, color: prefixIconColor),
          hintText: fieldName,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5))),
      onChanged: (text) {
        // do something with text
      },
    );
  }
}

//Custom STateless WIdget Class that helps re-usability
class  MyCustomTextField extends StatelessWidget {
  MyCustomTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  });
  final TextEditingController myController;
  String fieldName;
  final IconData myIcon;
  Color prefixIconColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: myController,
        keyboardType: TextInputType.number,
        obscureText: true,
        decoration: InputDecoration(
            hintText: fieldName,
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
            labelText: fieldName,
            prefixIcon: Icon(myIcon, color: prefixIconColor),
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.shade300,width: 3),
            ),
            labelStyle: const TextStyle(color: Colors.blue)),
        onChanged: (text) {
          // do something with text
        },
      ),
    );
  }
}



// Difference from texfield: it has two optional block of code(onSaved and validator) can be used to run
// code when the user saves the form.
//Custom STateless WIdget Class that helps re-usability
class MyCustomTextFormField extends StatelessWidget {
  MyCustomTextFormField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.deepPurple,
  });
  final TextEditingController myController;
  String fieldName;
  final IconData myIcon;
  Color prefixIconColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
          labelText: fieldName,
          hintText: fieldName,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
          prefixIcon: Icon(myIcon, color: prefixIconColor),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple.shade300,width: 3),
          ),
          labelStyle: const TextStyle(color: Colors.deepPurple)),
      onChanged: (text) {
        // do something with text
      },
      onSaved: (value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      validator: (value) {
        return value!.contains('@') ? 'Do not use the @ char.' : null;
      },
    );
  }
}