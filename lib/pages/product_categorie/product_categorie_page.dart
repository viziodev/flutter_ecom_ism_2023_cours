import 'package:flutter/material.dart';
import 'package:flutter_ecom_ism_2023/shared/widgets/custom_widget.dart';
import 'package:provider/provider.dart';

import '../../models/categorie_model.dart';
import '../../models/product_model.dart';
import '../../providers/data_provider.dart';
import '../../services/article_service.dart';
import '../../shared/constants.dart';
import '../../shared/widgets/app_bar_home.dart';
import '../../shared/widgets/home_product_list.dart';

class ProductCatagoriePage extends StatefulWidget {
  final Categorie categorie;
  const ProductCatagoriePage({super.key, required this.categorie});

  @override
  State<ProductCatagoriePage> createState() => _ProductCatagoriePageState();
}

class _ProductCatagoriePageState extends State<ProductCatagoriePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  void initData() {
    final dataProvider = Provider.of<EcomProvider>(context, listen: false);
    dataProvider.getAllProducts(categorieId: widget.categorie.id);
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<EcomProvider>(context, listen: true);
    return Scaffold(
        body: Center(
            child: ListView(
      children: [
        AppNavHome(
          label: widget.categorie.libelle,
          icon: false,
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
            products: dataProvider.productListByCat,
          ),
        ),
      ],
    )));
    ;
  }
}
