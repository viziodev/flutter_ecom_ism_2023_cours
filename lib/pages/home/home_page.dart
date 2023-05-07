import 'package:flutter/material.dart';
import 'package:flutter_ecom_ism_2023/services/categorie_service.dart';
import 'package:flutter_ecom_ism_2023/shared/constants.dart';
import 'package:flutter_ecom_ism_2023/shared/widgets/app_bar_home.dart';
import 'package:provider/provider.dart';

import '../../models/categorie_model.dart';
import '../../models/product_model.dart';
import '../../providers/data_provider.dart';
import '../../services/article_service.dart';
import '../../shared/widgets/custom_widget.dart';
import 'widgets/home_categorie_list.dart';
import '../../shared/widgets/home_product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  void initData() {
    final dataProvider = Provider.of<EcomProvider>(context, listen: false);
    dataProvider.initData();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<EcomProvider>(context, listen: true);
    return Scaffold(
        body: Center(
            child: ListView(
      //scrollDirection: Axis.vertical,
      children: [
        const AppNavHome(
          label: "Ecommerce",
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
          child: Column(
            children: [
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(children: [
                  Container(
                    height: 50,
                    width: 300,
                    margin: const EdgeInsets.only(left: 10),
                    child: const TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "search...."),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.camera_alt,
                      color: ecomPrymaryColor,
                    ),
                  )
                ]),
              ),
              labelWidget(text: "Categories"),
              HomeListCategorie(categories: dataProvider.categorieList),
              labelWidget(text: "Catalogue"),
              HomeProductList(
                products: dataProvider.productList,
              ),
            ],
          ),
        )
      ],
    )));
  }
}
