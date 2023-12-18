import 'package:flutter/material.dart';
import 'package:flutter_how_to_do/code_viewer/dart_file_reader.dart';

class SliderUsage extends StatefulWidget {
  const SliderUsage({super.key});

  @override
  State<SliderUsage> createState() => _SliderUsageState();
}

class _SliderUsageState extends State<SliderUsage> {

  double sliderValue = 30.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider",),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "Slider", filePath: "lib/09_slider/slider_usage.dart")));
          }, child: const Text("{code}",style: TextStyle(fontSize: 17),))
        ],
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(sliderValue.toInt().toString(),style: TextStyle(fontSize: 20),),

              //SLIDER 1 **************************************
              Slider(
                min: 0 ,
                max: 100,
                value: sliderValue,
                onChanged: (value){
                setState(() {
                  sliderValue = value;
                });
              }),

              //SLIDER 2 **************************************
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.red[700],
                  inactiveTrackColor: Colors.red[100],
                  trackShape: RoundedRectSliderTrackShape(),
                  trackHeight: 4.0,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  thumbColor: Colors.redAccent,
                  overlayColor: Colors.red.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                  tickMarkShape: RoundSliderTickMarkShape(),
                  activeTickMarkColor: Colors.red[700],
                  inactiveTickMarkColor: Colors.red[100],
                  valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  valueIndicatorColor: Colors.redAccent,
                  valueIndicatorTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Slider(
                  value: sliderValue,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: '$sliderValue',
                  onChanged: (value) {
                    setState(
                          () {
                        sliderValue = value;
                      },
                    );
                  },
                ),
              ),
            ],
          ),
      ),
    );
  }
}
