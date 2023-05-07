import 'product_model.dart';

class CartModel {
  int? id;
  List<Product> productList = [];
  double totalTtc;
  double totalHtc;
  CartModel({this.id, this.totalTtc = 0, this.totalHtc = 0});
}
