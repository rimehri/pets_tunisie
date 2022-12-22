import 'dart:convert';

class TypeAnimal {
  String? sId;
  String? typename;
  List<SousType>? sousType;
  int? iV;

  @override
  String toString() {
    return 'TypeAnimal{sId: $sId, typename: $typename, sousType: $sousType}';
  }

  TypeAnimal({this.sId, this.typename, this.sousType, this.iV});

  TypeAnimal.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    typename = json['typename'];
    if (json['sousType'] != null) {
      sousType = <SousType>[];
      json['sousType'].forEach((v) {
        sousType!.add(new SousType.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['typename'] = this.typename;
    if (this.sousType != null) {
      data['sousType'] = this.sousType!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class SousType {
  String? sId;
  String? name;

  @override
  String toString() {
    return 'SousType{sId: $sId, name: $name}';
  }

  SousType({this.sId, this.name});

  SousType.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}