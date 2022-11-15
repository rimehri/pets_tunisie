

import 'package:flutter/material.dart';
import 'package:pfe/widget/index/card.dart';
import 'package:pfe/widget/index/details_blog.dart';

class body extends StatelessWidget {
  const body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> blog = [
      { "text": "4 raisons pour lesquelles \n un animal de compagnie \n est bon pour vous ","image": "https://www.thepetexpress.co.uk/blog-admin/wp-content/uploads/2014/06/animal-731355_1920-1024x681.jpg"},
      { "text": "Why owning a pet or being \naround a pet is so \n good for you","image": "https://cdn-ds.com/blogs-media/sites/549/2018/08/29145137/dog-sitting-in-front-seat-of-car-with-sunglasses_b.jpg"},
      { "text": "Pets promote routine","image": "https://trendysilo.com/wp-content/uploads/2022/08/Conseils-de-Securite-en-Voyage-3.jpg"},
      { "text": "Pets remind you to play\n (and chill)","image": "https://www.besthealthmag.ca/wp-content/uploads/2020/04/pet-is-good-for-you.gif"},

      { "text": "4 raisons pour lesquelles\n  un animal de compagnie \n  est bon  pour vous","image": "https://www.thepetexpress.co.uk/blog-admin/wp-content/uploads/2014/06/animal-731355_1920-1024x681.jpg"},
      { "text": "Why owning a pet or being\n around a pet is so \n good for you","image": "https://cdn-ds.com/blogs-media/sites/549/2018/08/29145137/dog-sitting-in-front-seat-of-car-with-sunglasses_b.jpg"},
      { "text": "Pets promote routine","image": "https://trendysilo.com/wp-content/uploads/2022/08/Conseils-de-Securite-en-Voyage-3.jpg"},
      { "text": "Pets remind you to play\n (and chill)","image": "https://www.besthealthmag.ca/wp-content/uploads/2020/04/pet-is-good-for-you.gif"},


    ];
    return Container(

      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.35,
      child: ListView.builder(

          scrollDirection: Axis.vertical,
          itemCount: blog.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
               onTap: () {

            },
              child: card(

                image: blog[index]["image"],
                text: blog[index]["text"],
                press: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => details_blog(



                  )), );

                },

              ),
            );
          }
      ),
    );
  }
}
