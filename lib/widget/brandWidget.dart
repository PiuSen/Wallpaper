import 'package:flutter/material.dart';
import 'package:wallpaperhub/views/imageview.dart';

import '../model/photosmodel.dart';
Widget BrandName(){

  return RichText(
    text: TextSpan(
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
      children:[ TextSpan(
          text: "Wallpaper",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
        TextSpan(
        text: "Hub",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue))

      ],
      ),

    );

}
Widget  WallpaperList({required List<PhotosModel>photosModel,context}){
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(crossAxisCount: 2,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
        children: photosModel.map((walpaper) {
          return GridTile(child:
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageView(imageUrl: walpaper.src.portrait),
              )
              );
            },
            child: Hero(
              tag:walpaper.src.portrait ,
              child: Container(
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(10),
                   
                     child: Image.network(walpaper.src.portrait,fit: BoxFit.cover,)),


              ),
            ),
          )
          );

        }).toList(),


      ),
    ),
  );
}