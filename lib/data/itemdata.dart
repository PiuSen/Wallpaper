import 'package:flutter/cupertino.dart';

import '../model/categorymodel.dart';
String apiKey="fpeHL7EyTvpo0YeeG7BBlgPHrNym55jG5mx1EHhyDxGn7yKPIJROvPbe";

List<CategoryModel> getCategories() {

  List<CategoryModel>categories = [];
  CategoryModel categoryModel=CategoryModel();

  categoryModel.imgUrl =
  "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoryModel.categoriesName = "Street Art";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  //
  categoryModel.imgUrl =
  "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoryModel.categoriesName = "Wild Life";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  //
  categoryModel.imgUrl =
  "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoryModel.categoriesName = "Nature";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  //
  categoryModel.imgUrl =
  "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoryModel.categoriesName = "City";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  //
  categoryModel.imgUrl =
  "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categoryModel.categoriesName = "Motivation";

  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  //
  categoryModel.imgUrl =
  "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoryModel.categoriesName = "Bikes";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  //
  categoryModel.imgUrl =
  "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoryModel.categoriesName = "Cars";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  return categories;


}