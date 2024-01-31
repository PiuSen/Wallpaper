
import 'dart:convert';
import '../model/photosmodel.dart';
import 'package:http/http.dart' as http;
import 'itemdata.dart';

class Remote{
static Future<List<PhotosModel>> curatedImagese(int pageKey,String url) async {
    var response = await http.get(
        Uri.parse("$url&page=$pageKey"), headers: {"Authorization": apiKey});
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    List<PhotosModel> photos = [];
    jsonData["photos"].forEach((element) {
      PhotosModel photosModel;
      photosModel = PhotosModel.fromMap(element);
      photos.add(photosModel);
    });
    return photos;
  }
  
  
  
}