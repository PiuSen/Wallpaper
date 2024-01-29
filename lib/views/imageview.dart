
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
class ImageView extends StatefulWidget {
  late final String imageUrl;


  ImageView({required this.imageUrl}); //const ImageView({super.key});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var filePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Hero(
              tag: widget.imageUrl,
              child: Container(
                height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(widget.imageUrl,fit: BoxFit.cover,)),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      _save();
                      //Navigator.pop(context);

                    },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xff1C1818).withOpacity(0.8),

                        ),
                        height:50,
                        width: MediaQuery.of(context).size.width/2,

                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width/2,
                        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white38,width: 1),
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0x36FFFFFF),
                                  Color(0xFFFFFF)
                                ],
                                begin: FractionalOffset.topLeft,
                                end: FractionalOffset.bottomRight

                            )
                        ),
                        child:  SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [
                              Text("Set Wallpaper",style: TextStyle(fontSize: 14,color: Colors.white),),
                              SizedBox(height: 5,),

                              Text("Image will be save in gallery",style: TextStyle(
                                  fontSize: 12,color: Colors.white
                              ),)

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
    ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                      child: Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 16),)),
                  SizedBox(height: 50,)
                ],
              ),
            )
          ],
        ),


    );
  }
  _save() async {
    if(Platform.isAndroid){
    //  await _askPermission();
    }

    var response = await Dio().get(widget.imageUrl,
        options: Options(responseType: ResponseType.bytes));
    final result =
    await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  // _askPermission() async {
  //   if (Platform.isAndroid) {
  //    // Map<PermissionGroup, PermissionStatus> permissions =
  //         await PermissionHandler()
  //         .requestPermissions([PermissionGroup.photos]);
  //   } else {
  //      //PermissionStatus permission =
  //      await PermissionHandler()
  //         .checkPermissionStatus(PermissionGroup.storage);
  //   }
  // }


}


