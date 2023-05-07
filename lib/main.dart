import 'package:flutter/material.dart';
import 'package:flutter_ecom_ism_2023/pages/cart/cart_page.dart';
import 'package:flutter_ecom_ism_2023/pages/home/home_page.dart';
import 'package:flutter_ecom_ism_2023/pages/product_categorie/product_categorie_page.dart';
import 'package:flutter_ecom_ism_2023/providers/cart_provider.dart';
import 'package:flutter_ecom_ism_2023/providers/data_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => EcomProvider(),
      ),
       ChangeNotifierProvider(
        create: (_) => CartPovider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        initialRoute: "home",
        routes: {
          "home": (context) => const HomePage(),
          "cart":(context) => const CartPage(),
          // "categorie": (context) => const ProductCatagoriePage(),
        });
  }
}
