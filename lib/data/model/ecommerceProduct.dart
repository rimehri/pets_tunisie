import 'dart:convert';

class Product {
  String? sId;
  String? pName;
  String? user;
  String? pDescription;
  int? pPrice;
  int? pSold;
  int? pQuantity;
  List<String>? pImages;
  String? pOffer;
  String? pStatus;

  String? createdAt;
  String? updatedAt;

  Product ProductFromJson(String str) => Product.fromJson(json.decode(str));
  @override
  String toString() {
    return 'Product{sid: $sId, user:$user,pName: $pName,pDescription: $pDescription,pPrice: $pPrice,createdAt:$createdAt, updatedAt:$updatedAt, pSold: $pSold,pQuantity:$pQuantity,pOffer:$pOffer,pStatus:$pStatus}';
  }
  Product(
      {this.sId,
        this.user,
        this.pName,
        this.pDescription,
        this.pPrice,
        this.pSold,
        this.pQuantity,
        this.pImages,
        this.pOffer,
        this.pStatus,

        this.createdAt,
        this.updatedAt,
    });

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    pName = json['pName'];
    pDescription = json['pDescription'];
    pPrice = json['pPrice'];
    pSold = json['pSold'];
    pQuantity = json['pQuantity'];
    pImages = json['pImages'].cast<String>();
    pOffer = json['pOffer'];
    pStatus = json['pStatus'];

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['pName'] = this.pName;
    data['pDescription'] = this.pDescription;
    data['pPrice'] = this.pPrice;
    data['pSold'] = this.pSold;
    data['pQuantity'] = this.pQuantity;
    data['pImages'] = this.pImages;
    data['pOffer'] = this.pOffer;
    data['pStatus'] = this.pStatus;

    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;

    return data;
  }
}