import 'package:flutter/material.dart';

import '../../../models/categorie_model.dart';
import '../../../shared/widgets/custom_widget.dart';
import '../../product_categorie/product_categorie_page.dart';

class HomeListCategorie extends StatefulWidget {
  final List<Categorie> categories;
  const HomeListCategorie({super.key, required this.categories});

  @override
  State<HomeListCategorie> createState() => _HomeListCategorieState();
}

class _HomeListCategorieState extends State<HomeListCategorie> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          for (int i = 0; i < widget.categories.length; i++)
            itemCategorie(
              categorie: widget.categories[i],
            ),
        ]));
  }

  Container itemCategorie({required Categorie categorie}) {
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
            "images/${categorie.photo}",
            height: 40,
            width: 40,
          ),
          InkWell(
              onTap: () {
                //Navigator.pushNamed(context, "categorie");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProductCatagoriePage(
                        categorie: categorie,
                      );
                    },
                  ),
                );
              },
              child: TextWidget(
                text: categorie.libelle,
                size: 16,
              ))
        ]));
  }
}
