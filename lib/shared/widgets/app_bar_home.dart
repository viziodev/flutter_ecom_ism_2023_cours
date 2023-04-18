import 'package:flutter/material.dart';
import 'package:flutter_ecom_ism_2023/shared/constants.dart';
import 'package:badges/badges.dart' as badges;
import 'custom_widget.dart';

class AppNavHome extends StatefulWidget {
  final String label;
  final bool iconCart;
  final bool icon;
  const AppNavHome({
    super.key,
    required this.label,
    this.icon = true,
    this.iconCart = true,
  });

  @override
  State<AppNavHome> createState() => _AppNavHomeState();
}

class _AppNavHomeState extends State<AppNavHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          //Icon
          widget.icon == true
              ? Icon(
                  Icons.sort,
                  size: 30,
                  color: ecomPrymaryColor,
                )
              : InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: ecomPrymaryColor,
                  ),
                ),
          //Text
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: TextWidget(
              text: widget.label,
            ),
          ),
          //Icon
          const Spacer(),
          if (widget.iconCart)
            badges.Badge(
              badgeContent: TextWidget(
                text: "5",
                color: Colors.white,
                size: 15,
              ),
              badgeStyle: badges.BadgeStyle(
                // badgeColor: Colors.redAccent,
                padding: const EdgeInsets.all(6),
                borderRadius: BorderRadius.circular(3),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "categorie");
                },
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 30,
                  color: ecomPrymaryColor,
                ),
              ),
            )
        ],
      ),
    );
  }
}
