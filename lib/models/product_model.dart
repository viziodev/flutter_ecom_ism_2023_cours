class Product {
  final int id;
  final String libelle;
  final double oldPrice;
  final double newPrice;
  final String image;
  final bool saled;
  final String categorie;
  double qteStock;
  double qteComd;
  double montant;
  Product({
    required this.id,
    required this.libelle,
    required this.oldPrice,
    required this.newPrice,
    required this.image,
    required this.saled,
    required this.categorie,
    required this.qteStock,
    required this.qteComd,
    required this.montant,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      libelle: map['libelle'] ?? '',
      oldPrice: map['oldPrice']?.toDouble() ?? 0.0,
      newPrice: map['newPrice']?.toDouble() ?? 0.0,
      image: map['image'] ?? '',
      saled: map['saled'] ?? false,
      categorie: map['categorie'] ?? '',
      qteStock: map['qteStock']?.toDouble() ?? 0.0,
      qteComd: map['qteComd']?.toDouble() ?? 0.0,
      montant: map['montant']?.toDouble() ?? 0.0,
    );
  }
}
