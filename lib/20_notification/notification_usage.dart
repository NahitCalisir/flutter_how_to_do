import 'package:flutter/material.dart';
import 'package:flutter_how_to_do/code_viewer/dart_file_reader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationUsage extends StatefulWidget {
  const NotificationUsage({super.key});

  @override
  State<NotificationUsage> createState() => _NotificationUsageState();
}

class _NotificationUsageState extends State<NotificationUsage> {

  var flp = FlutterLocalNotificationsPlugin();

  Future<void> kurulum() async {
    var androidAyari = const AndroidInitializationSettings("@mipmap/ic_launcher");
    var iosAyari = const DarwinInitializationSettings();
    var kurulumAyari = InitializationSettings(android: androidAyari, iOS: iosAyari);
    await flp.initialize(kurulumAyari, onDidReceiveNotificationResponse: bildirimSecilme);
  }

  Future<void> bildirimSecilme(NotificationResponse notificationResponse) async {
    var payload = notificationResponse.payload;
    if(payload != null) {
      print("Bildirim Seçildi: $payload");
    }
  }

  Future<void> bildirimGoster() async {
    var androidBildirimDetay = const AndroidNotificationDetails(
        "id", //bildirimleri gruplamaya yarar. istediğimiz id ismini verip onunla gruplama yapabiliriz.
        "name",
        channelDescription: "channelDescription",
        priority: Priority.high, //eski yapı için
        importance: Importance.max); //güncel yapı için
    var iosBildirimDetay = DarwinNotificationDetails();
    var bildirimDetay = NotificationDetails(android: androidBildirimDetay, iOS: iosBildirimDetay);
    await flp.show(0, "Başlık", "İçeriği Buraya yaz", bildirimDetay,payload: "Payload İçeriği");
  }

  @override
  void initState() {
    super.initState();
    kurulum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "Grid View",
                    filePath: "lib/20_notification/notification_usage.dart")));
          }, child: const Text("{code}",style: TextStyle(fontSize: 17),))
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("* 'flutter_local_notifications' kütüphanesini ekle\n"
                  "* Android Studioyu güncel sürüme yükseltmek için\n"
                  "  android/app/build.gradle dosyası içerisinde\n"
                  "  compileSdkVersion 33\n"
                  "  minSdkVersion 21 yap\n"
                  "* ios/Runner/AppDelegate.swift dosyası içersine Bool ifadesinden sonra aşağıdaki kodu ekle:\n"
                  "  if #available(iOS 10.0,*){\n"
                  "    UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate}\n"
                  "* Uygulama iconu üzerine basılı tutup 'App info' dan bildirimlere izin ver."),
            ),
            ElevatedButton(onPressed: (){
              bildirimGoster();
            }, child: Text("Create Notification")),
          ],
        ),
      ),
    );
  }
}
