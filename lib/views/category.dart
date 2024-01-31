import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperhub/views/wallpaper_list.dart';

import '../data/itemdata.dart';
import '../model/photosmodel.dart';
import '../widget/brandWidget.dart';

class Category extends StatefulWidget {
  final String CategoryName;

  Category(
      {super.key, required this.CategoryName}); //const Category({super.key}

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<PhotosModel> photos = [];

  getCategoryWallpaper() async {
    String url =
        "https://api.pexels.com/v1/search?query=${widget.CategoryName}&per_page=20&page=1";
    //var uri=Uri.parse("https://api.pexels.com/v1/curated?per_page=1");
    var response =
        await http.get(Uri.parse(url), headers: {"Authorization": apiKey});
    //.then(value){
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      //print(element);
      PhotosModel photosModel;
      photosModel = PhotosModel.fromMap(element);
      photos.add(photosModel);
      //print(photosModel.toString()+ "  "+ photosModel.src.portrait);
    });

    setState(() {});
  }

  @override
  void initState() {
    getCategoryWallpaper();
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: BrandName(),
        elevation: 0.0,
      ),
      body: WallpaperList(
        url:
            "https://api.pexels.com/v1/search?query=${widget.CategoryName}&per_page=20",
      ),
    );
  }
}
