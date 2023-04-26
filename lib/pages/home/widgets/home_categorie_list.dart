import 'package:flutter/material.dart';

import '../../../shared/widgets/custom_widget.dart';

class HomeListCategorie extends StatefulWidget {
  const HomeListCategorie({super.key});

  @override
  State<HomeListCategorie> createState() => _HomeListCategorieState();
}

class _HomeListCategorieState extends State<HomeListCategorie> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          for (int i = 0; i < 7; i++) itemCategorie(),
        ]));
  }

  Container itemCategorie() {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(children: [
          Image.asset(
            "images/1.png",
            height: 40,
            width: 40,
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, "categorie");
              },
              child: TextWidget(
                text: "Categorie 1",
                size: 16,
              ))
        ]));
  }
}
