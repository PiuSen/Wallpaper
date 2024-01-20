import 'dart:convert';

import 'package:flutter/material.dart';

import '../data/itemdata.dart';
import '../model/categorymodel.dart';
import '../model/photosmodel.dart';
import '../widget/brandWidget.dart';
import 'package:http/http.dart' as http;
class Search extends StatefulWidget {
  late final String searchQuery;


  Search({required this.searchQuery}); //const Search({super.key});

  @override
  State<Search> createState() => _SearchState();

}

class _SearchState extends State<Search> {
  TextEditingController searchController=TextEditingController();
  List<CategoryModel>categories=[];
  List<PhotosModel>photos=[];

  getSearchWallpaper(String query)async{
    String url="https://api.pexels.com/v1/search?query=$query&per_page=30&page=1";
    //var uri=Uri.parse("https://api.pexels.com/v1/curated?per_page=1");
    var response= await http.get ( Uri.parse(url),
        headers: {
          "Authorization": apiKey});
    //.then(value){
    Map <String,dynamic> jsonData = jsonDecode(response.body);
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
    getSearchWallpaper(widget.searchQuery);
    // TODO: implement initState
    super.initState();
    searchController.text=widget.searchQuery;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: BrandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
                child: Column(
                   children: [
                               Container(
                                    padding: EdgeInsets.symmetric(horizontal: 24),
                                           decoration: BoxDecoration(
                                      color: Color(0xffeaebee),
                                       borderRadius: BorderRadius.circular(20)
                                       ),

                                       margin: EdgeInsets.symmetric(horizontal: 24),
                                         child:  Row(
                                                   children: [
                                                  Expanded(
                                                    child:TextField(
                                                       controller: searchController,
                                                         decoration: const InputDecoration(
                                                      hintText: "Search Wallpaper.....",
                                                        border: InputBorder.none,
                                           ),
                                           ),
                                                ),

                                                GestureDetector(
                                                    onTap: (){
                                                         Navigator.push(context,
                                                MaterialPageRoute(builder:
                                                (context)=>Search(searchQuery: searchController.text,)));

                                                 },
                                                child: Container(
                                                child: Icon(Icons.search)
                                                ),
                                              ),
                                         ],
                                          ),
                                         ),
                                         SizedBox(height: 10,),
                                         WallpaperList(photosModel: photos,context: context)
                                            ],
                                        ),
                                          ),
      ),
                                           );
                                       }
                                     }
