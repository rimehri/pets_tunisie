

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/size_config.dart';

class card_blog extends StatelessWidget {

  const card_blog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> blog = [
      { "text": "4 Reasons a pet Is Good for you ","image": "https://www.thepetexpress.co.uk/blog-admin/wp-content/uploads/2014/06/animal-731355_1920-1024x681.jpg"},
      { "text": "Why owning a pet or being around a pet is so good for you","image": "https://cdn-ds.com/blogs-media/sites/549/2018/08/29145137/dog-sitting-in-front-seat-of-car-with-sunglasses_b.jpg"},
      { "text": "Pets promote routine","image": "https://trendysilo.com/wp-content/uploads/2022/08/Conseils-de-Securite-en-Voyage-3.jpg"},
      { "text": "Pets remind you to play (and chill)","image": "https://www.besthealthmag.ca/wp-content/uploads/2020/04/pet-is-good-for-you.gif"},

      { "text": "4 Reasons a pet Is Good for you ","image": "https://www.thepetexpress.co.uk/blog-admin/wp-content/uploads/2014/06/animal-731355_1920-1024x681.jpg"},
      { "text": "Why owning a pet or being around a pet is so good for you","image": "https://cdn-ds.com/blogs-media/sites/549/2018/08/29145137/dog-sitting-in-front-seat-of-car-with-sunglasses_b.jpg"},
      { "text": "Pets promote routine","image": "https://trendysilo.com/wp-content/uploads/2022/08/Conseils-de-Securite-en-Voyage-3.jpg"},
      { "text": "Pets remind you to play (and chill)","image": "https://www.besthealthmag.ca/wp-content/uploads/2020/04/pet-is-good-for-you.gif"},


    ];
   return Container(
     padding: const EdgeInsets.only(top: 80.0),
     width: MediaQuery.of(context).size.width,
     height: MediaQuery.of(context).size.height*0.35,
     child: ListView.builder(

scrollDirection: Axis.horizontal,
          itemCount: blog.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryCard(

                  image: blog[index]["image"],
                  text: blog[index]["text"],
                  press: () {

                  },

                );
              }
      ),
   );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
required this.image,
    required this.text,
    required this.press,
  }) : super(key: key);
final String image ;
  final String?  text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(

        margin: EdgeInsets.all(5),
          height: 250,
          width:200,

          decoration: BoxDecoration(

            image:  DecorationImage(
              image: NetworkImage(image.isNotEmpty?image:""),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child:Padding(
            padding: const EdgeInsets.only(top: 68.0,left: 8),
            child: Text(text!,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
          )
      ),
    );
  }
}
