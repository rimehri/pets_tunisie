

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfe/data/features/ecommerce/product.dart';
import 'package:pfe/widget/e-commerce/cartItem.dart';

import 'cart/detailProduct.dart';

class ItemsWidget extends StatefulWidget {
  const ItemsWidget({Key? key}) : super(key: key);

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  Future? doc;
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<dynamic>(
      future: doc,
      builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
          ) {
        print(snapshot.connectionState);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return  Container (
            margin: EdgeInsets.only(top: 200),
            child: CupertinoActivityIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          print("---------");
          print(snapshot.data);
          print("---------");
          if (snapshot.hasError) {

            return const Text('Error');
          } else if (snapshot.hasData) {
      return GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 0.68,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push( context, MaterialPageRoute(builder: (context) => DetailsProduct(product: snapshot.data[index],)), );
                    },
                    child: cartItem(cart:snapshot.data[index] ,

                  ),




                  );
                });
          } else {
            return const Text('Empty data');
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );

  }
  @override
  void initState() {
    doc = getallProduct();
    // TODO: implement initState
    super.initState();
  }

}
