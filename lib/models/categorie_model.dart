class Categorie {
  int? id;
  final String libelle;
  final String photo;
  Categorie({
    this.id,
    required this.libelle,
    required this.photo,
  });

  factory Categorie.fromMap(Map<String, dynamic> map) {
   return  Categorie(
     id: map['id']?.toInt(),
     photo: map['photo'] ?? '',
     libelle: map['libelle'] ?? '',
   );
 }


  
}
