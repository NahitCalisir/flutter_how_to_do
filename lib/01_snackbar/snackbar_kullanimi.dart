import 'package:flutter/material.dart';
import 'package:flutter_how_to_do/code_viewer/dart_file_reader.dart';

class SnacbarKullanimi extends StatefulWidget {

  @override
  State<SnacbarKullanimi> createState() => _SnackbarKullanimiState();
}

class _SnackbarKullanimiState extends State<SnacbarKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snackbar",),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "SnacBar", filePath: "lib/01_snackbar/snackbar_kullanimi.dart")));
          }, child: Text("{code}",style: TextStyle(fontSize: 17),))
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Silmek \nistiyor musunuz?",
                    style: TextStyle(color: Colors.white,fontSize: 20),),
                  //backgroundColor: Colors.red,
                  //duration: Duration(seconds: 2),
                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                  action: SnackBarAction(label: "Evet",textColor: Colors.red, onPressed: (){
                    //2.SNACBAR (Eveti tıkladığında yeni bir snacbar aç:
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Silindi",style: TextStyle(color: Colors.white,fontSize: 20),),
                        backgroundColor: Colors.red,
                        duration: Durations.medium4
                      ),);
                  }),
                ),);
            },
                child: const Text("Snacbar Özel")),
          ],
        ),
      ),
    );
  }
}
