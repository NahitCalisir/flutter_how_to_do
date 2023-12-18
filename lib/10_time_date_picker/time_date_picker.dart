import 'package:flutter/material.dart';
import 'package:flutter_how_to_do/code_viewer/dart_file_reader.dart';

class TimeDatePicker extends StatefulWidget {
  const TimeDatePicker({super.key});

  @override
  State<TimeDatePicker> createState() => _TimeDatePickerState();
}

class _TimeDatePickerState extends State<TimeDatePicker> {

  var tfTimeController = TextEditingController();
  var tfDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    //We used padLeft(2,"0")}" to format time and date: (1:5 => 01:05) !!!!
    String defaultHour = "${DateTime.now().hour.toString().padLeft(2,"0")}";
    String defaultMinute = "${DateTime.now().minute.toString().padLeft(2,"0")}";
    String defaultDay = "${DateTime.now().day.toString().padLeft(2,"0")}";
    String defaultMonth = "${DateTime.now().month.toString().padLeft(2,"0")}";
    String defaultYear = "${DateTime.now().year.toString().padLeft(2,"0")}";

    tfTimeController.text = "$defaultHour:${defaultMinute}:";
    tfDateController.text = "$defaultDay/${defaultMonth}/${defaultYear}";


    return Scaffold(
      appBar: AppBar(
        title: const Text("Time & Date Picker",),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "Time & Date Picker", filePath: "lib/10_time_date_picker/time_date_picker.dart")));
          }, child: const Text("{code}",style: TextStyle(fontSize: 17),))
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Row(
                children: [
                  SizedBox(width: 50,
                      child: TextField(
                        controller: tfTimeController,
                        decoration: const InputDecoration(hintText: "Time"),
                      ),
                  ),
                  IconButton(onPressed: (){
                    showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now())
                        .then((value) {
                          tfTimeController.text = "${value!.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}";
                    });
                  }, icon: const Icon(Icons.access_time)),

                  SizedBox(width: 120,
                      child: TextField(
                        controller: tfDateController,
                        decoration: const InputDecoration(hintText: "Date"),
                      ),
                  ),
                  IconButton(onPressed: (){
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030))
                        .then((value) {
                      tfDateController.text = "${value!.day.toString().padLeft(2, '0')}/${value.month.toString().padLeft(2, '0')}/${value.year}";
                    });
                  }, icon: const Icon(Icons.date_range)),
                ],
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
