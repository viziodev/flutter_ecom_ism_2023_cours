import 'package:flutter/material.dart';
import 'package:flutter_ecom_ism_2023/shared/widgets/custom_widget.dart';

import '../../shared/constants.dart';
import '../../shared/widgets/app_bar_home.dart';
import '../../shared/widgets/home_product_list.dart';

class ProductCatagoriePage extends StatelessWidget {
  const ProductCatagoriePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(
      children: [
        const AppNavHome(
          label: "Montres",
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
          child: const HomeProductList(),
        ),
      ],
    )));
    ;
  }
}
