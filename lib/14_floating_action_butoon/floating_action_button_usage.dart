import 'package:flutter/material.dart';
import 'package:flutter_how_to_do/code_viewer/dart_file_reader.dart';

class FloatingActionBUttonUsage extends StatefulWidget {
  const FloatingActionBUttonUsage({super.key});

  @override
  State<FloatingActionBUttonUsage> createState() => _FloatingActionBUttonUsageState();
}

class _FloatingActionBUttonUsageState extends State<FloatingActionBUttonUsage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade700,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white,),
        centerTitle: true,
        backgroundColor: Colors.black45,
        title: Text(
          "Floating Action Button",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "Scroll View",
                    filePath: "lib/floating_action_butoon/floating_action_button_usage.dart")));
          }, child: const Text("{code}",style: TextStyle(fontSize: 17,color: Colors.white),))
        ],
      ),

      //FLOATING ACTION BUTTON *********************************
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.yellow,
        elevation: 0,
        shape: CircleBorder( //OR: BeveledRectangleBorder etc.,
              //side: BorderSide(color: Colors.blue, width: 2.0, style: BorderStyle.solid)
             ),
         //mini: true,
      ),

      //BOTTOM NAVIGATION BAR  *****************************************
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        shape: CircularNotchedRectangle(),
        color: Colors.black87,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(right: 20.0, top: 2.0, bottom: 2.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  Text(
                    "Shop",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 20.0, top: 2.0, bottom: 2.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  Text(
                    "Fav",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  Text(
                    "Setting",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
