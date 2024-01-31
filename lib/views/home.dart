import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperhub/data/itemdata.dart';
import 'package:wallpaperhub/model/photosmodel.dart';
import 'package:wallpaperhub/views/category.dart';
import 'package:wallpaperhub/views/search.dart';
import 'package:wallpaperhub/views/wallpaper_list.dart';
import 'package:wallpaperhub/widget/brandWidget.dart';

import '../model/categorymodel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scrollController = ScrollController();

  int totalPages = 3;
  int page = 1;

  // int itemsPerPage = 20;
  bool isLoading = false;
  List<CategoryModel> categories = [];
  List<PhotosModel> photos = [];
  TextEditingController searchController = TextEditingController();

  Future<void> getTrendingWallpaper() async {
    String url = "https://api.pexels.com/v1/curated?per_page=20";
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
    //scrollController.addListener(_scrollListener) ;
    getTrendingWallpaper();
    categories = getCategories();
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
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                  color: Color(0xffeaebee),
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search here.....",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Search(
                                    searchQuery: searchController.text,
                                  )));
                    },
                    child: Container(child: Icon(Icons.search)),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoriesTile(
                      imgURL: categories[index].imgUrl,
                      title: categories[index].categoriesName,
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
//               WallpaperList(photosModel: photos, context: context),
            //WallpaperList(photosModel: photos,context: context),
            Expanded(
              child: WallpaperList(url: "https://api.pexels.com/v1/curated?per_page=20",),
            ),
          ],
        ),
      ),
    );
  }

// Future<void> _scrollListener() async {
//   if (isLoading) return;
//   if (scrollController.position.pixels ==
//       scrollController.position.maxScrollExtent) {
//     // page=page+1;
//     setState(() {
//       isLoading = true;
//     });
//     //page=page+1;
//     await WallpaperList(photosModel: photos, context: context);
//     setState(() {
//       isLoading = false;
//     });
//     print("Scroll listener called");
//   } else {
//     print("dont call");
//   }
// }
}

class CategoriesTile extends StatelessWidget {
  //const CategoriesTile({super.key});
  final String imgURL, title;

  CategoriesTile({required this.title, required this.imgURL});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Category(
                      CategoryName: title.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 4),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imgURL,
                  height: 70,
                  width: 100,
                  fit: BoxFit.cover,
                )),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              height: 70,
              width: 100,
              alignment: Alignment.center,
              child: Text(
                title,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
