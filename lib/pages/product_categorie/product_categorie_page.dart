import 'package:flutter/material.dart';
import 'package:flutter_ecom_ism_2023/shared/widgets/custom_widget.dart';

import '../../shared/widgets/app_bar_home.dart';

class ProductCatagoriePage extends StatelessWidget {
  const ProductCatagoriePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(
      scrollDirection: Axis.vertical,
      children: [
        const AppNavHome(
          label: "Montres",
          icon: false,
          iconCart: false,
        ),
        Center(
          child: TextWidget(
            text: "Page Produits d'une Categorie",
          ),
        )
      ],
    )));
    ;
  }
}
