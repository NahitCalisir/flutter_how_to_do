import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_how_to_do/code_viewer/dart_file_reader.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/*
YAPILACAKALR LİSTESİ;
"• Android Studioyu güncel sürüme yükseltmek için\n"
"  android/app/build.gradle dosyası içerisinde\n"
"  compileSdkVersion 33\n"
"  minSdkVersion 21 yap\n"
"• Konum izni almak için gereken komutları\n"
"  android/app/src/main/AndroidManifest.xml\n"
"  dosyasına ekle\n"
"• iOS da konum izni için gerekli komutları\n"
"  ios/Runner/Info.plist dosyasına ekle\n"
"• Uygulama iconu üzerine basılı tutup 'App info' dan\n"
" konum alma izni ver.\n"
"• google_maps_flutter kütüphanesini ekle\n"
"• Aşağıdaki adresden API key al(ücretli);\n"
"  https://cloud.google.com/maps-platform/\n"
"• API keyi aşağıdaki dosyaya ekle;\n"
"  android/app/src/main/AndroidManifest.xml\n"
"  <meta-data\n"
"   android:name='com.google.android.geo.API_KEY'\n"
"   android:value='api key here'/>\n"
"• ios için ios/Runner/AppDelegate.swift\n"
"  doyasına GoogleMaps'i import et ve API keyi ekle;\n"
"  GMSServices.provideAPIKey('api key here')\n"
"• ios da haritayı görüntülemek için\n"
"  info.plist dosyasına aşağıdaki satırı ekle\n"
"  <key>io.flutter.embedded_views_preview</key>\n"
"  <string>YES</string>\n"),
*/
class MapUsage extends StatefulWidget {
  const MapUsage({super.key});

  @override
  State<MapUsage> createState() => _MapUsageState();
}

class _MapUsageState extends State<MapUsage> {

  Completer<GoogleMapController> mapControl = Completer();

  //@39.9032599,32.5979577,11z ankara
  var baslangicKonum = const CameraPosition(target: LatLng(39.9032599, 32.5979577),zoom: 11);

  List<Marker> markerList = <Marker>[];

  Future<void> konumaGit() async {
    GoogleMapController controller = await mapControl.future;
    //@41.0370013,28.974792,15z Taksim
    var gidilecekKonum = const CameraPosition(target: LatLng(41.0370013, 28.974792),zoom: 13);

    controller.animateCamera(CameraUpdate.newCameraPosition(gidilecekKonum));

    //Marker oluşturma
    var gidilecekYerMarker = const Marker(
      markerId: MarkerId("id2"),
      position: LatLng(41.0370013, 28.974792),
      infoWindow: InfoWindow(title: "Taksim", snippet: "Taksim Meydanı"),
    );

    setState(() {
      markerList.add(gidilecekYerMarker);
    });
  }

  //Başlangıç yeri marker oluşturma
  var baslangicMarker = const Marker(
    markerId: MarkerId("id1"),
    position: LatLng(39.9032599, 32.5979577),
    infoWindow: InfoWindow(title: "Ankara", snippet: "Merkez"),
  );

  @override
  void initState() {
    super.initState();
    markerList.add(baslangicMarker); //add marker
  }

  @override
  Widget build(BuildContext context) {
    //Screen Size Info
    final MediaQueryData screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Layout Rules"),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "Grid View",
                    filePath: "lib/22_map_usage/map_usage.dart")));
          }, child: const Text("{code}",style: TextStyle(fontSize: 17),))
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: screenWidth,height: screenHeight - 153,
              child: GoogleMap(
                initialCameraPosition: baslangicKonum,
                mapType: MapType.normal,
                markers: Set<Marker>.of(markerList), //add Marker
                onMapCreated: (GoogleMapController controller) {
                  mapControl.complete(controller);
                },
              ),
            ),
            ElevatedButton(onPressed: (){
              konumaGit();
            }, child: const Text("GO")),
          ],
        ),
      ),
    );
  }
}
