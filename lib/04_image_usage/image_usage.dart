import 'package:flutter/material.dart';
import 'package:flutter_how_to_do/code_viewer/dart_file_reader.dart';

class ImageUsage extends StatefulWidget {
  const ImageUsage({super.key});

  @override
  State<ImageUsage> createState() => _ImageUsageState();
}

class _ImageUsageState extends State<ImageUsage> {

  String imageName = "smile.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image",),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DartFileReader(title: "Image", filePath: "lib/04_image_usage/image_usage.dart")));
          }, child: Text("{code}",style: TextStyle(fontSize: 17),))
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                //Creating Circular Images: ************************************
                Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/seed/904/600',
                      ),
                    ),

                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blue,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            "https://picsum.photos/seed/904/600",
                          ),
                        ),
                      ),
                    ),

                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("images/nahit.png",
                        width: 100,
                        height: 100,
                        color: Colors.red,
                        colorBlendMode: BlendMode.colorDodge,
                        fit: BoxFit.cover,
                        ),
                    ),

                    Card(
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      elevation: 10,
                      shadowColor: Colors.pink,
                      child: Image.network(
                        'https://picsum.photos/seed/904/600',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: Image.network(
                        'https://picsum.photos/seed/picsum/200/300',
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),

                    PhysicalModel(
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAlias,
                        elevation: 20,
                        shadowColor: Colors.pink,
                        shape: BoxShape.circle,
                        child: Image.network(
                          'https://picsum.photos/seed/904/600',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )),
                  ],
                ),

                //Creating Images with Rounded Corners: ************************
                Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      height: 120,
                      clipBehavior: Clip.antiAlias,
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(15) // Adjust the radius as needed
                      ),
                      child: Image.asset(
                        'images/nahit.png',
                        fit: BoxFit.cover,
                      ),
                    ),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
                      child: Image.network(
                        'https://picsum.photos/seed/904/600',
                        fit: BoxFit.cover,
                        width: 150,
                        height: 200,
                      ),
                    ),

                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
                      ),
                      clipBehavior: Clip.antiAlias,
                      elevation: 10,
                      shadowColor: Colors.blue,
                      child: Image.network(
                        'https://picsum.photos/seed/picsum/200/300',
                        width: 150,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),

                    PhysicalModel(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        clipBehavior: Clip.antiAlias,
                        elevation: 20,
                        shadowColor: Colors.grey,
                        child: Image.network(
                          'https://picsum.photos/seed/picsum/200/300',
                          width: 150,
                          height: 120,
                          fit: BoxFit.cover,
                        ))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
