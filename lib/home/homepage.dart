import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_flutter/home/utils/globle.dart';
import 'dart:io';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Image Picker',style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        height: h,
        width: w,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Container(
              height: h/2.7,
              width: w/1.3,
              decoration: (fileImage!=null)?BoxDecoration(
                image: DecorationImage(
                  image: FileImage(fileImage!),
                  fit: BoxFit.cover
                ),
              ):BoxDecoration(
              color: Colors.blue,
              ),
              // child: CircleAvatar(
              //   radius: 80,
              //   backgroundColor: Colors.blue,
              //   backgroundImage: (fileImage!=null)?FileImage(fileImage!):null,
              // ),
            ),
            const SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () async {
                  XFile? xfileImage=await imagePicker.pickImage(source: ImageSource.camera);
                  setState(() {
                    fileImage=File(xfileImage!.path);
                  });
                }, icon: const Icon(Icons.camera_alt,color: Colors.black,size: 60,),),
                IconButton(onPressed: () async {
                  XFile? xfileImage=await imagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    fileImage=File(xfileImage!.path);
                  });
                }, icon: const Icon(Icons.image,color: Colors.black,size: 60,),),
              ],
            ),
            SizedBox(height: 70,),
            Container(
              height: h/18,
              width: w/1.1,
              decoration: BoxDecoration(
              color: Colors.blue,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text('Upload Me',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
            )
          ],
        ),
      ),
    );
  }
}
