import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom_ism_2023/shared/constants.dart';
import 'package:flutter_ecom_ism_2023/shared/widgets/custom_widget.dart';

class HomeProductList extends StatefulWidget {
  const HomeProductList({super.key});

  @override
  State<HomeProductList> createState() => _HomeProductListState();
}

class _HomeProductListState extends State<HomeProductList> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.68,
      shrinkWrap: true,
      children: [for (int i = 0; i < 12; i++) itemProduct()],
    );
  }

  Container itemProduct() {
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
            child: Image.asset("images/1.png"),
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
                  text: "Product 1",
                  size: 15,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(
                  CupertinoIcons.cart_badge_plus,
                  color: Colors.red,
                ),
              )
              
            ],
          )
        ],
      ),
    );
  }
}
