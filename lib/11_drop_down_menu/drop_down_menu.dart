import 'package:flutter/material.dart';
import 'package:flutter_how_to_do/code_viewer/dart_file_reader.dart';

class DropDownMenuUsage extends StatefulWidget {
  const DropDownMenuUsage({super.key});

  @override
  State<DropDownMenuUsage> createState() => _DropDownMenuUsageState();
}

class _DropDownMenuUsageState extends State<DropDownMenuUsage> {

  var countryList = <String>[];
  String? selectedCountry;
  String? _chosenValue;

  @override

  void initState() {
    //Generally fetch data from database here
    super.initState();
    countryList.add("Türkiye");
    countryList.add("İtalya");
    countryList.add("Japonya");

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drop Down Menu",),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "Drop Down Menu", filePath: "lib/11_drop_down_menu/drop_down_menu.dart")));
          }, child: const Text("{code}",style: TextStyle(fontSize: 17),))
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            //DROP DOWN MENU ********************
            DropdownButton(
              value: selectedCountry,
              //icon: const Icon(Icons.arrow_downward_outlined),
              //focusColor: Colors.indigo,
              //elevation: 5,
              //style: const TextStyle(color: Colors.blue),
              //iconEnabledColor:Colors.red,
              //dropdownColor: Colors.pink.shade50,
              hint: const Text("Please chose a country"),
              items: countryList.map((country){
                return DropdownMenuItem(
                    value:country,
                    child: Text(country));
              }).toList(),
              onChanged: (String? selectedItem){
                setState(() {
                  selectedCountry = selectedItem;
                });
              }),

            DropdownButton<String>(
              focusColor:Colors.white,
              value: _chosenValue,
              //elevation: 5,
              style: TextStyle(color: Colors.white),
              iconEnabledColor:Colors.black,
              hint:const Text(
                "Please choose a language",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              items: <String>[
                'Android',
                'IOS',
                'Flutter',
                'Node',
                'Java',
                'Python',
                'PHP',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style:TextStyle(color:Colors.black),),
                );
              }).toList(),

              onChanged: (String? value) {
                setState(() {
                  _chosenValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
