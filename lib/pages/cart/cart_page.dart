import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom_ism_2023/shared/widgets/custom_widget.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../providers/cart_provider.dart';
import '../../shared/constants.dart';
import '../../shared/widgets/app_bar_home.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<CartPovider>(context, listen: true);
    return Scaffold(
        body: Center(
            child: ListView(children: [
      const AppNavHome(
        label: "Panier",
        icon: false,
        iconCart: false,
      ),
      Container(
          padding: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: ecomSecondaryColor,
          ),
          child: Column(children: [
            for (int i = 0; i < dataProvider.cart.productList.length; i++)
              cartItem(produit: dataProvider.cart.productList[i]),
          ]))
    ])));
  }

  Container cartItem({required Product produit}) {
    return Container(
      height: 110,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Radio(
            value: "",
            groupValue: "",
            onChanged: (value) {},
            activeColor: ecomPrymaryColor,
          ),
          Container(
            // margin: const EdgeInsets.only(right: 15),
            height: 70,
            width: 70,
            child: Image.asset("images/${produit.image}"),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              //Axe principal y =>mainAxisAlignment
              //Axe horizontal ==>crossAxisAlignment
              children: [
                TextWidget(text: produit.libelle, size: 13),
                TextWidget(text: produit.newPrice.toString(), size: 13),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      child: Icon(CupertinoIcons.minus),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 1,
                            )
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: TextWidget(
                          text: produit.qteComd.toString(), size: 18),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      child: Icon(CupertinoIcons.plus),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 1,
                            )
                          ]),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
