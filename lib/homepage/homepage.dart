import 'package:flutter/material.dart';
import 'package:flutter_how_to_do/02_alert/alert_usage.dart';
import 'package:flutter_how_to_do/06_checkbox/checkbox_usage.dart';
import 'package:flutter_how_to_do/07_radio_button/radio_button.dart';
import 'package:flutter_how_to_do/08_progress_bar/progress_bar.dart';
import 'package:flutter_how_to_do/09_slider/slider_usage.dart';
import 'package:flutter_how_to_do/10_time_date_picker/time_date_picker.dart';
import 'package:flutter_how_to_do/11_drop_down_menu/drop_down_menu.dart';
import 'package:flutter_how_to_do/12_gesture_dedector/gesture_dedector_usage.dart';
import 'package:flutter_how_to_do/13_scroll_view/scroll_view_usage.dart';
import 'package:flutter_how_to_do/15_list_view/list_view_usage.dart';
import 'package:flutter_how_to_do/14_floating_action_butoon/floating_action_button_usage.dart';
import 'package:flutter_how_to_do/16_cupertino_list_section/cupertino_list_section_usage.dart';
import 'package:flutter_how_to_do/homepage/konular.dart';
import 'package:flutter_how_to_do/04_image_usage/image_usage.dart';
import 'package:flutter_how_to_do/01_snackbar/snackbar_kullanimi.dart';
import 'package:flutter_how_to_do/05_switch/switch_usage.dart';
import 'package:flutter_how_to_do/03_text_field/text_field.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();

}

class _HomepageState extends State<Homepage> {

  Future<List<Konular>> konulariYukle() async {
    var konuListesi = <Konular>[];
    var konu1 = Konular(title: "1.SnackBar", image: "images/items/snackbar.gif", sayfa: SnacbarKullanimi());
    var konu2 = Konular(title: "Alert", image: "images/items/alert_item.png", sayfa: const AlertUsage());
    var konu3 = Konular(title: "Text Fields", image: "images/items/textfield.png", sayfa: const TextFieldPage());
    var konu4 = Konular(title: "Image", image: "images/items/image.png", sayfa: const ImageUsage());
    var konu5 = Konular(title: "Switch", image: "images/items/switch.png", sayfa: SwitchUsage());
    var konu6 = Konular(title: "Checkbox", image: "images/items/checkbox.png", sayfa: CheckboxUsage());
    var konu7 = Konular(title: "Radio Button", image: "images/items/radiobutton.png", sayfa: RadioButton());
    var konu8 = Konular(title: "Progress Bar", image: "images/items/progress.gif", sayfa: ProgressBar());
    var konu9 = Konular(title: "Slider", image: "images/items/slider.png", sayfa: SliderUsage());
    var konu10 = Konular(title: "Time & Date Picker", image: "images/items/timepicker.png", sayfa: TimeDatePicker());
    var konu11 = Konular(title: "Drop Down Menu", image: "images/items/dropdownmenu.png", sayfa: DropDownMenuUsage());
    var konu12 = Konular(title: "Gesture Detector", image: "images/items/gesture.jpeg", sayfa: GestureDedectorUsage());
    var konu13 = Konular(title: "Scroll View", image: "images/items/scroll.gif", sayfa: ScrollViewUsage());
    var konu14 = Konular(title: "Floating Action Button", image: "images/items/fab.png", sayfa: FloatingActionBUttonUsage());
    var konu15 = Konular(title: "List View", image: "images/items/listview.png", sayfa: ListViewUsage());
    var konu16 = Konular(title: "Cupertino List Section", image: "images/items/cupertinolist.png", sayfa: CupertinoListSectionUsage());

    konuListesi.add(konu1);
    konuListesi.add(konu2);
    konuListesi.add(konu3);
    konuListesi.add(konu4);
    konuListesi.add(konu5);
    konuListesi.add(konu6);
    konuListesi.add(konu7);
    konuListesi.add(konu8);
    konuListesi.add(konu9);
    konuListesi.add(konu10);
    konuListesi.add(konu11);
    konuListesi.add(konu12);
    konuListesi.add(konu13);
    konuListesi.add(konu14);
    konuListesi.add(konu15);
    konuListesi.add(konu16);

    return konuListesi;
  }

  @override
  Widget build(BuildContext context) {

    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    return Scaffold(backgroundColor: Color(0xff131230),
      appBar: AppBar(
        title: const Text("How To Do?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Color(0xff131230),
      ),
      body: FutureBuilder<List<Konular>>(
        future: konulariYukle(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var konuListesi = snapshot.data;
            return ListView.builder(
              itemCount: konuListesi!.length,
                itemBuilder: (context,indeks){
                  var konu = konuListesi[indeks];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => konu.sayfa,
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
                      child: Card(
                        child: Container(
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: const LinearGradient(
                              colors: [
                                Colors.pink,
                                Colors.deepPurple,
                                Color(0xff131230)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3), // Gölge rengi ve opaklığı
                                spreadRadius: 2, // Yayılma yarıçapı
                                blurRadius: 5, // Bulanıklık yarıçapı
                                offset: const Offset(3, 3), // Gölge konumu (x, y)
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(konu.title,style: const TextStyle(color:Colors.white,fontSize: 30,),),
                                ),
                                Image.asset(konu.image,height: 135,width: screenWidth*0.86,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
            );
          } else {
            return const Center();
          }
        },
      )
    );
  }
}


