import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[

          Category(
            image_location: 'images/categoris/suit.png',
            image_caption: 'Formal',
          ),

          Category(
            image_location: 'images/categoris/jacket.png',
            image_caption: 'Informal',
          ),

          Category(
            image_location: 'images/categoris/pants.png',
            image_caption: 'Pants',
          ),

          Category(
            image_location: 'images/categoris/soccer.png',
            image_caption: 'Tshirts',
          ),

          Category(
            image_location: 'images/categoris/dress.png',
            image_caption: 'Dresses',
          ),

          Category(
            image_location: 'images/categoris/sneaker.png',
            image_caption: 'shoes',
          ),

        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;

  final String image_caption;

  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              height: 80.0,
              width: 100.0,
            ),
            subtitle: Container(
                alignment: Alignment.topCenter,
                child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(image_caption))),
          ),
        ),
      ),
    );
  }
}
