import 'package:flutter/material.dart';
import 'package:shopapp_tut/pages/product_details.dart';
import 'package:shopapp_tut/pages/product_details.dart';

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var product_list = [
    {
      "name": "Yellow Blazer",
      "picture": "images/products/yello_blazer.jpg",
      "old_price": 220,
      "price": 180,
    },
    {
      "name": "Blue Dress",
      "picture": "images/products/dress_light_blue.jpg",
      "old_price": 239,
      "price": 214,
    },
    {
      "name": "Half boot",
      "picture": "images/products/shoe_half_boot_grey_blue.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Green dress",
      "picture": "images/products/dress_green.jpg",
      "old_price": 120,
      "price": 85,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_Single_product(
            product_name: product_list[index]['name'],
            product_picture: product_list[index]['picture'],
            product_old_price: product_list[index]['old_price'],
            product_price: product_list[index]['price'],
          );
        });
  }
}

class Similar_Single_product extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_old_price;
  final product_price;

  Similar_Single_product(
      {this.product_name,
        this.product_picture,
        this.product_old_price,
        this.product_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: Text('A'),
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(

                // *** here we`re passing the values of the product to details page ***
                  builder: (context) => ProductDetails(
                    product_detail_name: product_name,
                    product_detail_new_price: product_price,
                    product_detail_old_price: product_old_price,
                    product_detail_picture: product_picture,
                  ))),
              child: GridTile(
                  footer: Container(
                      color: Colors.white70,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                                product_name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0
                                ),
                              )),
                          Text(
                            "\$${product_price}",
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      )),
                  child: Image.asset(
                    product_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
