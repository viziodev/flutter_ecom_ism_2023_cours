import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom_ism_2023/models/categorie_model.dart';
import 'package:flutter_ecom_ism_2023/models/product_model.dart';

import '../services/article_service.dart';
import '../services/categorie_service.dart';

class EcomProvider with ChangeNotifier {
  CategorieService categorieService = CategorieService();
  ArticleService articleService = ArticleService();

  final List<Product> _productList = [];
  List<Product> get productList => _productList;

  final List<Product> _productListByCat = [];
  List<Product> get productListByCat => _productListByCat;

  final List<Categorie> _categorieList = [];
  List<Categorie> get categorieList => _categorieList;

  Future<void> getAllCategories() async {
    try {
      List<Categorie> datas = await categorieService.getAllCategories();
      _categorieList.addAll(datas);
      notifyListeners();
    } on Response catch (e) {
      print("Erreur :${e.statusCode}");
    }
  }

  Future<void> getAllProducts({int? categorieId}) async {
    try {
      List<Product> datas =
          await articleService.getAllProducts(categorieId: categorieId);
      if (categorieId != null) {
        _productListByCat.clear();
        _productListByCat.addAll(datas);
      } else {
        _productList.addAll(datas);
      }

      notifyListeners();
    } on Response catch (e) {
      print("Erreur :${e.statusCode}");
    }
  }

  Future<void> initData() async {
    await Future.wait([
         getAllCategories(),
         getAllProducts()
    ]);
  }
}
