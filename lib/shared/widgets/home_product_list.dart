import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom_ism_2023/shared/constants.dart';
import 'package:flutter_ecom_ism_2023/shared/widgets/custom_widget.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../providers/cart_provider.dart';

class HomeProductList extends StatefulWidget {
  final List<Product> products;
  const HomeProductList({super.key, required this.products});

  @override
  State<HomeProductList> createState() => _HomeProductListState();
}

class _HomeProductListState extends State<HomeProductList> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<CartPovider>(context, listen: true);
    return GridView.count(
      crossAxisCount: 2, //200px    100px 100px
      childAspectRatio: 0.68, //68px  68px  => 64px
      shrinkWrap: true,
      children: [
        for (int i = 0; i < widget.products.length; i++)
          itemProduct(
              product: widget.products[i],
              callback: () {
                dataProvider.addCart(widget.products[i]);
              }),
      ],
    );
  }

  Container itemProduct({required Product product, Function? callback}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      padding: const EdgeInsets.only(left: 5, right: 2, top: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
              if (product.saled)
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: ecomPrymaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextWidget(
                    text: "saled",
                    size: 15,
                    color: Colors.white,
                  ),
                )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Image.asset(
              "images/${product.image}",
            ),
            height: 110,
            width: 110,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10),
                child: TextWidget(
                  text: product.libelle,
                  size: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: InkWell(
                  onTap: () {
                    callback!();
                  },
                  child: const Icon(
                    CupertinoIcons.cart_badge_plus,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 5, top: 5),
            alignment: Alignment.centerLeft,
            child: TextWidget(
                bold: false,
                text: "Lorem Ipsum is simply dummy text ...",
                size: 15),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5, left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "\$${product.newPrice}",
                  size: 12,
                  color: Colors.red,
                ),
                if (product.saled)
                  TextWidget(
                    text: "\$${product.oldPrice}",
                    size: 12,
                    color: Colors.black,
                    decoration: true,
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
