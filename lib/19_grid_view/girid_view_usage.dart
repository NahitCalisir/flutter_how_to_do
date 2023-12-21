import 'package:flutter/material.dart';
import 'package:flutter_how_to_do/code_viewer/dart_file_reader.dart';

class GridViewUsage extends StatefulWidget {
  const GridViewUsage({super.key});

  @override
  State<GridViewUsage> createState() => _GridViewUsageState();
}

class _GridViewUsageState extends State<GridViewUsage> {

  Future<List<pictures>> filmleriYukle() async {
    var pictureList = <pictures>[];
    var p1 = pictures(id: 1, ad: "Django", resim: "mcc1.jpg");
    var p2 = pictures(id: 2, ad: "Interstellar", resim: "mcc2.jpg");
    var p3 = pictures(id: 3, ad: "Inception", resim: "mcc3.jpg");
    var p4 = pictures(id: 4, ad: "The Hateful Eight", resim: "mcc4.jpg");
    var p5 = pictures(id: 5, ad: "The Pianist", resim: "mcc5.jpg");
    var p6 = pictures(id: 6, ad: "Anadoluda", resim: "mcc6.jpg");
    var p7 = pictures(id: 7, ad: "Anadoluda", resim: "mcc7.jpg");
    var p8 = pictures(id: 8, ad: "Anadoluda", resim: "mcc8.jpg");
    var p9 = pictures(id: 9, ad: "Anadoluda", resim: "mcc9.jpg");
    var p10 = pictures(id: 10, ad: "Anadoluda", resim: "mcc10.jpg");
    pictureList.add(p1);
    pictureList.add(p2);
    pictureList.add(p3);
    pictureList.add(p4);
    pictureList.add(p5);
    pictureList.add(p6);
    pictureList.add(p7);
    pictureList.add(p8);
    pictureList.add(p9);
    pictureList.add(p10);
    return pictureList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MCC Cycling Club"),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "Grid View",
                    filePath: "lib/19_grid_view/girid_view_usage.dart")));
          }, child: const Text("{code}",style: TextStyle(fontSize: 17),))
        ],
      ),
      body: FutureBuilder<List<pictures>>(
          future: filmleriYukle(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              var filmListesi = snapshot.data;
              return GridView.builder(
                  itemCount: filmListesi!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,childAspectRatio: 1 / 1),// width 1 ise hight 1 katı olsun
                  itemBuilder: (context,indeks){
                    var picture = filmListesi[indeks];
                    return GestureDetector(
                      onTap: (){},
                      child: Card(
                        child: SizedBox(height: 129.1,width: 129.1,
                            child: Image.asset("images/mcc/${picture.resim}",fit: BoxFit.fill,)),
                      ),
                    );
                  });
            } else {
              return Text("Error");
            }
          }),
    );
  }
}

class pictures{
  int id;
  String ad;
  String resim;
  pictures({required this.id, required this.ad, required this.resim});
}