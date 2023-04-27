import 'package:dio/dio.dart';
import 'package:flutter_ecom_ism_2023/models/product_model.dart';

import 'api_service.dart';

class ArticleService {
  Future<List<Product>> getAllProducts({int? categorieId}) async {
    //On construit l'url
    Response response = await ApiService.getData("/articles",params: {"category_id":categorieId});
    if (response.statusCode == 200) {
      List<dynamic> results = response.data;
      List<Product> datas = [];
      for (dynamic map in results) {
        Product data = Product.fromMap(map);
        datas.add(data);
      }
      return datas;
    } else {
      throw response;
    }
  }
}
