import 'package:dio/dio.dart';
import 'package:flutter_ecom_ism_2023/models/categorie_model.dart';

import 'api_service.dart';

class CategorieService {
  Future<List<Categorie>> getAllCategories() async {
    //On construit l'url
    Response response = await ApiService.getData("/categories");
    if (response.statusCode == 200) {
      List<dynamic> results = response.data;
      List<Categorie> categories = [];
      for (dynamic map in results) {
           Categorie cat = Categorie.fromMap(map);
        categories.add(cat);
      }
      return categories;
    } else {
      throw response;
    }
  }
}
