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

class SearchOnAppBar extends StatefulWidget {
  const SearchOnAppBar({super.key});

  @override
  State<SearchOnAppBar> createState() => _SearchOnAppBarState();
}

class _SearchOnAppBarState extends State<SearchOnAppBar> {
  bool aramaYapiliyormu = false;
  String aranankelime = "";

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

  Future<List<Contacts>> search(String aramaKelimesi) async {
    aranankelime = aramaKelimesi;
    print(aramaKelimesi);
    List<Contacts> gecisListesi = [];
    gecisListesi = await fetchContacts();
    if(aramaKelimesi.isNotEmpty){
      var filtrelenmisListe = <Contacts>[];
      gecisListesi.forEach((contact) {
        if(contact.contact_ad.toLowerCase().contains(aramaKelimesi)) {
          filtrelenmisListe.add(contact);
        }
      });
      return filtrelenmisListe;
    } else {
      return gecisListesi;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyormu ?
        TextField(
          decoration: InputDecoration(hintText: "Search Text"),
          onChanged: (arananKelime){
            setState(() {
              search(arananKelime);
            });

          },
        ):
        Text("Contacts"),
        actions: [
          aramaYapiliyormu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyormu = false;
            });
          }, icon:Icon(Icons.clear)):
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyormu = true;
            });
          }, icon:Icon(Icons.search)),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "Scroll View",
                    filePath: "lib/15_list_view/list_view_usage.dart")));
          }, child: const Text("{code}",style: TextStyle(fontSize: 17),))
        ],
      ),
      body: FutureBuilder(
        future: aramaYapiliyormu ? search(aranankelime):fetchContacts(), //sadece filtrelenmiş listeyide çağırsak olurdu
        builder: (context,snapshot) {
          if(snapshot.hasData){
            var kisiListesi = snapshot.data;
            return ListView.builder(
                itemCount: kisiListesi!.length,
                itemBuilder: (context,indeks){ // LOOP for each contact
                  var kisi = kisiListesi[indeks];
                  return SizedBox(height: 66,
                    child: GestureDetector(
                      onTap: (){},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey,
                                    width: 1,
                                  )
                              ),

                            ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(kisi.contact_ad,style: TextStyle(fontSize: 20),),
                                      Text(kisi.contact_tel),
                                    ],
                                  ),
                                ),
                                IconButton(onPressed: (){

                                }, icon: Icon(Icons.close))
                              ],
                            )
                        ),
                      ),
                    ),
                  );
                });
          } return const Center();
        },
      ),
    );
  }
}
