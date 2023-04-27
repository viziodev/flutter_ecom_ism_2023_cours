import 'package:flutter/material.dart';
import 'package:flutter_ecom_ism_2023/shared/widgets/custom_widget.dart';

import '../../models/categorie_model.dart';
import '../../models/product_model.dart';
import '../../services/article_service.dart';
import '../../shared/constants.dart';
import '../../shared/widgets/app_bar_home.dart';
import '../../shared/widgets/home_product_list.dart';

class ProductCatagoriePage extends StatefulWidget {
  final Categorie categorie;
  const ProductCatagoriePage({super.key,required this.categorie});

  @override
  State<ProductCatagoriePage> createState() => _ProductCatagoriePageState();
}

class _ProductCatagoriePageState extends State<ProductCatagoriePage> {
  ArticleService articleService = ArticleService();

  List<Product> productList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  void initData() {
    articleService.getAllProducts(categorieId: widget.categorie.id).then((value) {
      setState(() {
        productList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(
      children: [
         AppNavHome(
          label: widget.categorie.libelle,
          icon: false,
          iconCart: false,
        ),
        Container(
          padding: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: ecomSecondaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: HomeProductList(
            products: productList,
          ),
        ),
      ],
    )));
    ;
  }
}
