import 'dart:convert';

class Annonce {
  String? sId;
  String? titre;
  String? user;
  String? description;
  String? type;
  num? prix;
  String? date_creation;
  List<String>? photos;

  String? categorie;
  Annonce annonceFromJson(String str) => Annonce.fromJson(json.decode(str));
  @override
  String toString() {
    return 'Annonce{sid: $sId, user:$user,titre: $titre,description: $description,prix: $prix,date_creation:$date_creation,  phots: $photos,}';
  }
  Annonce(
      {this.sId,
        this.titre,
        this.description,
        this.type,
        this.prix,
        this.date_creation,
        this.photos,
this.user,
        this.categorie});

  Annonce.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    titre = json['Titre'];
    user =json['user'];
    description = json['description'];
    type = json['type'];
    prix = json['prix'];
    date_creation = json['date_creation'];
    photos = json['photos'].cast<String>();

    categorie = json['categorie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Titre'] = this.titre;
    data['user'] = this.user;
    data['description'] = this.description;
    data['type'] = this.type;
    data['prix'] = this.prix;
    data['date_creation']= this.date_creation;
    data['photos'] = this.photos;

    data['categorie'] = this.categorie;
    return data;
  }
}