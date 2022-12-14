import 'dart:convert';
class Autogenerated {
  String? token;
  User? user;

  Autogenerated({this.token, this.user});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }}
class User {
 String? sId;
  String? name;
//late  String gender;
   String? addresse;
  String? phone;
   String? email;
   String? password;
 //late List<Role> role;

   String? image;
   int? resetCode;
   bool? isActive;
   List<Animal>? animal;

 User userFromJson(String str) => User.fromJson(json.decode(str));
 @override
 String toString() {
   return 'User{image: $image, isActive: $isActive,id: $sId,  email: $email, password: $password, Name: $name,  resetCode:$resetCode,phone: $phone,animal:$animal}';
 }
  User(
      { required this.sId,
        required this.name,
       // required this.gender,
        required this.addresse,
        required this.phone,
        required this.email,
        required   this.password,
        //required this.role,
        required  this.image,
        required  this.resetCode,
        required  this.isActive,
    this.animal,
        });

  User.fromJson(Map<dynamic, dynamic> json) {
    sId = json['_id'];

    name = json['Name'];
    //gender = json['gender'];
    addresse = json['addresse'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    // if (json['role'] != null) {
    //   role = <Role>[];
    //   json['role'].forEach((v) {
    //     role.add(new Role.fromJson(v));
    //   });
    // }
    image = json['image'];
    resetCode = json['resetCode'];
    isActive = json['isActive'];
    if (json['animal'] != null) {
      animal = <Animal>[];
      json['animal'].forEach((v) {
        animal?.add(new Animal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
   // data['gender'] = this.gender;
    data['addresse'] = this.addresse;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    // if (this.role != null) {
    //   data['role'] = this.role.map((v) => v.toJson()).toList();
    // }
    data['image'] = this.image;
    data['resetCode'] = this.resetCode;
    data['isActive'] = this.isActive;
    if (this.animal != null) {
      data['animal'] = this.animal?.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

// class Role {
//   String rolename;
//   String sId;
//
//   Role({this.rolename, this.sId});
//
//   Role.fromJson(Map<String, dynamic> json) {
//     rolename = json['rolename'];
//     sId = json['_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['rolename'] = this.rolename;
//     data['_id'] = this.sId;
//     return data;
//   }
// }
//
class Animal {
  String? sId;
  String? name;
  String? genre;
  String? dateNaissance;
  String? etatSante;
  num? poids;
  num? taille;
  String? race;
  String? description;
  String? image;
  String? typeAnimal;

  Animal(
      {
     required  this.sId,
        required   this.name,
        required   this.genre,
        required    this.dateNaissance,
        required   this.etatSante,
        required   this.poids,
        required   this.taille,
        required   this.race,
        required   this.description,
        this.image,
        this.typeAnimal});
  @override
  String toString() {
    return 'animal{name: $name, genre: $genre, dateNaissance: $dateNaissance, etatSante: $etatSante,poids: $poids,taille:$taille,race:$race,description:$description,image:$image,typeanimal:$typeAnimal}';
  }
  Animal.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    genre = json['genre'];
    dateNaissance = json['date_naissance'];
    etatSante = json['etat_sante'];
   poids = json['poids'];
    taille = json['taille'];
    race = json['race'];
    description = json['Description'];
    image = json['image'];
    typeAnimal = json['type_animal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['genre'] = this.genre;
    data['date_naissance'] = this.dateNaissance;
    data['etat_sante'] = this.etatSante;
    data['poids'] = this.poids;
    data['taille'] = this.taille;
    data['race'] = this.race;
    data['Description'] = this.description;
    data['image'] = this.image;
data['type_animal'] =this.typeAnimal;
    return data;
  }
}

