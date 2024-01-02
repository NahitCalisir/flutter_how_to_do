import 'dart:math';

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
import 'package:flutter_how_to_do/18_filter_search_listview/filter_search_listview.dart';
import 'package:flutter_how_to_do/17_search_on_appbar/search_on_appbar.dart';
import 'package:flutter_how_to_do/00_homepage/konular.dart';
import 'package:flutter_how_to_do/04_image_usage/image_usage.dart';
import 'package:flutter_how_to_do/01_snackbar/snackbar_kullanimi.dart';
import 'package:flutter_how_to_do/05_switch/switch_usage.dart';
import 'package:flutter_how_to_do/03_text_field/text_field.dart';
import 'package:flutter_how_to_do/19_grid_view/girid_view_usage.dart';
import 'package:flutter_how_to_do/20_notification/notification_usage.dart';
import 'package:flutter_how_to_do/21_location/location.dart';
import 'package:flutter_how_to_do/22_map_usage/map_usage.dart';
import 'package:flutter_how_to_do/23_layout/layout_rules.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();

}

class _HomepageState extends State<Homepage> {

  Future<List<Konular>> konulariYukle() async {
    var konuListesi = <Konular>[];
    var konu1 = Konular(title: "1. SnackBar", image: "images/items/snackbar.gif", sayfa: SnacbarKullanimi());
    var konu2 = Konular(title: "2. Alert", image: "images/items/alert_item.png", sayfa: const AlertUsage());
    var konu3 = Konular(title: "3. Text Fields", image: "images/items/textfield.png", sayfa: const TextFieldPage());
    var konu4 = Konular(title: "4. Image", image: "images/items/image.png", sayfa: const ImageUsage());
    var konu5 = Konular(title: "5. Switch", image: "images/items/switch.png", sayfa: SwitchUsage());
    var konu6 = Konular(title: "6. Checkbox", image: "images/items/checkbox.png", sayfa: CheckboxUsage());
    var konu7 = Konular(title: "7. Radio Button", image: "images/items/radiobutton.png", sayfa: RadioButton());
    var konu8 = Konular(title: "8. Progress Bar", image: "images/items/progress.gif", sayfa: ProgressBar());
    var konu9 = Konular(title: "9. Slider", image: "images/items/slider.png", sayfa: SliderUsage());
    var konu10 = Konular(title: "10. Time & Date Picker", image: "images/items/timepicker.png", sayfa: TimeDatePicker());
    var konu11 = Konular(title: "11. Drop Down Menu", image: "images/items/dropdownmenu.png", sayfa: DropDownMenuUsage());
    var konu12 = Konular(title: "12. Gesture Detector", image: "images/items/gesture.jpeg", sayfa: GestureDedectorUsage());
    var konu13 = Konular(title: "13. Scroll View", image: "images/items/scroll.gif", sayfa: ScrollViewUsage());
    var konu14 = Konular(title: "14. Floating Action Button", image: "images/items/fab.png", sayfa: FloatingActionBUttonUsage());
    var konu15 = Konular(title: "15. List View", image: "images/items/listview.png", sayfa: ListViewUsage());
    var konu16 = Konular(title: "16. Cupertino List Section", image: "images/items/cupertinolist.png", sayfa: CupertinoListSectionUsage());
    var konu17 = Konular(title: "17. Search On App Bar", image: "images/items/searchonappbar.png", sayfa: SearchOnAppBar());
    var konu18 = Konular(title: "18. Filter/Search ListView", image: "images/items/filterlist.png", sayfa: FilterSearchListView());
    var konu19 = Konular(title: "19. Grid View", image: "images/items/gridview.png", sayfa: GridViewUsage());
    var konu20 = Konular(title: "20. Notification", image: "images/items/notification.gif", sayfa: NotificationUsage());
    var konu21 = Konular(title: "21. Current Location", image: "images/items/location.png", sayfa: Location());
    var konu22 = Konular(title: "22. Map Usage", image: "images/items/map.png", sayfa: MapUsage());
    var konu23 = Konular(title: "23. Layout Rules", image: "images/items/layout.png", sayfa: LayoutRules());

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
    konuListesi.add(konu17);
    konuListesi.add(konu18);
    konuListesi.add(konu19);
    konuListesi.add(konu20);
    konuListesi.add(konu21);
    konuListesi.add(konu22);
    konuListesi.add(konu23);

    return konuListesi;
  }

  @override
  Widget build(BuildContext context) {

    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    return Scaffold(backgroundColor: Color(0xff14012c),//Color(0xff131230),
      appBar: AppBar(
        title: const Text("How To Do?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Color(0xff14012c),
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
                      child: Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(40),
                              //bottomLeft: Radius.circular(2),
                              //topLeft: Radius.circular(2),
                              //topRight: Radius.circular(2),
                          ),
                          gradient:  LinearGradient(
                            colors: [
                              //Colors.pink,
                              //Colors.purple,
                              Colors.deepPurple,
                              //Color(0xffb14fd6),
                              //Color(0xff275d9d),
                              Color(0xff1c023a),
                              Color(0xff1c023a),
                              Colors.primaries[Random().nextInt(Colors.primaries.length)],
                              //Color(0xff131230),
                              //Colors.deepPurple,
                              //Colors.purple,
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
                                child: Text(konu.title,style: const TextStyle(color:Colors.white,fontSize: 22,),),
                              ),
                              Image.asset(konu.image,height: 142,width: screenWidth*0.86,),
                            ],
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


