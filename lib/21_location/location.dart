import 'package:flutter/material.dart';
import 'package:flutter_how_to_do/code_viewer/dart_file_reader.dart';
import 'package:geolocator/geolocator.dart';

/*
YAPILACAKALR LİSTESİ;
"* geolocator kütüphanesini ekle\n"
"* Android Studioyu güncel sürüme yükseltmek için\n"
"  android/app/build.gradle dosyası içerisinde\n"
"  compileSdkVersion 33\n"
"  minSdkVersion 21 yap\n"
"* Konum izni almak için gereken komutları\n"
"  android/app/src/main/AndroidManifest.xml\n"
"  dosyasına ekle\n"
"* iOS da konum izni için gerekli komutları\n"
"  ios/Runner/Info.plist dosyasına ekle\n"
"* Uygulama iconu üzerine basılı tutup 'App info' dan\n"
" konum alma izni ver."
 */

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  double enlem = 0.0;
  double boylam = 0.0;

  Future<void> konumBilgisiAl() async {
    var konum = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      enlem = konum.latitude;
      boylam = konum.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Location"),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "Grid View",
                    filePath: "lib/21_location/location.dart")));
          }, child: const Text("{code}",style: TextStyle(fontSize: 17),))
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Latitude: $enlem",style: TextStyle(fontSize: 30),),
            Text("Longitude: $boylam",style: TextStyle(fontSize: 30),),
            ElevatedButton(onPressed: (){
              konumBilgisiAl();
            }, child: const Text("Get Location")),
          ],
        ),
      ),
    );
  }
}
