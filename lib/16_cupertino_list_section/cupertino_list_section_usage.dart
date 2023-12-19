import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_how_to_do/code_viewer/dart_file_reader.dart';

class Contacts {
  int contact_id;
  String contact_ad;
  String contact_tel;
  Contacts({required this.contact_id, required this.contact_ad, required this.contact_tel});
}

class CupertinoListSectionUsage extends StatefulWidget {
  const CupertinoListSectionUsage({super.key});

  @override
  State<CupertinoListSectionUsage> createState() => _CupertinoListSectionUsageState();
}

class _CupertinoListSectionUsageState extends State<CupertinoListSectionUsage> {

  Future<List<Contacts>> fetchContacts() async {
    var contactList = <Contacts>[];
    var k1 = Contacts(contact_id: 1, contact_ad: "Nahit Çalışır", contact_tel: "0999 999 99 99");
    var k2 = Contacts(contact_id: 1, contact_ad: "Ali Güngören", contact_tel: "0999 999 99 99");
    var k3 = Contacts(contact_id: 1, contact_ad: "Veli Kızılok", contact_tel: "0999 999 99 99");
    contactList.add(k1);
    contactList.add(k2);
    contactList.add(k3);
    return contactList;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "Scroll View",
                    filePath: "lib/16_cupertino_list_section/cupertino_list_section_usage.dart")));
          }, child: const Text("{code}",style: TextStyle(fontSize: 17),))
        ],
      ),
      body: FutureBuilder(
        future: fetchContacts(),
        builder: (context,snapshot) {
          if(snapshot.hasData){
            var kisiListesi = snapshot.data;
            return CupertinoPageScaffold(
              //navigationBar: const CupertinoNavigationBar(
              //  middle: Text('Cupertino Lists'),
              //),
              child: SafeArea(
                child: CupertinoListSection(
                  children: List.generate(
                    kisiListesi!.length,
                        (index) => CupertinoListTile(
                          title: Text(kisiListesi[index].contact_ad,style: TextStyle(fontSize: 20),),
                          subtitle: Text(kisiListesi[index].contact_tel),
                          trailing: Icon(Icons.close),
                          leading: Icon(Icons.person),
                    ),
                  ),
                ),
              ),
            );
          } return const Center();
        },
      ),
    );
  }
}
