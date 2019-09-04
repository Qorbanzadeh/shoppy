import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_tut/main.dart';

class Cart_products extends StatefulWidget {

  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  @override
  Widget build(BuildContext context) {
    var products_on_the_cart = [
      {
        "name": "Blue Dress",
        "picture": "images/products/dress_light_blue.jpg",
        "price": 214,
        "size": "XL",
        "color": "Blue",
        "Quantity": 5,
      },
      {
        "name": "Half boot",
        "picture": "images/products/shoe_half_boot_blue.jpg",
        "price": 85,
        "size": "42",
        "color": "Blue",
        "Quantity": 1,
      },
      {
        "name": "Blue Dress",
        "picture": "images/products/dress_light_blue.jpg",
        "price": 214,
        "size": "XL",
        "color": "Blue",
        "Quantity": 5,
      },
      {
        "name": "Blue Dress",
        "picture": "images/products/dress_light_blue.jpg",
        "price": 214,
        "size": "XL",
        "color": "Blue",
        "Quantity": 5,
      },
      {
        "name": "Blue Dress",
        "picture": "images/products/dress_light_blue.jpg",
        "price": 214,
        "size": "XL",
        "color": "Blue",
        "Quantity": 5,
      },
      {
        "name": "Blue Dress",
        "picture": "images/products/dress_light_blue.jpg",
        "price": 214,
        "size": "XL",
        "color": "Blue",
        "Quantity": 5,
      },
      {
        "name": "Blue Dress",
        "picture": "images/products/dress_light_blue.jpg",
        "price": 214,
        "size": "XL",
        "color": "Blue",
        "Quantity": 5,
      },
    ];

    return ListView.builder(
        itemCount: products_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            products_on_cart_counter: products_on_the_cart.length,
              product_name: products_on_the_cart[index]["name"],
              product_picture: products_on_the_cart[index]["picture"],
              product_price: products_on_the_cart[index]["price"],
              product_size: products_on_the_cart[index]["size"],
              product_color: products_on_the_cart[index]["color"],
              product_qty: products_on_the_cart[index]["Quantity"]);
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final products_on_cart_counter;
  final product_name;
  final product_picture;
  final product_price;
  final product_size;
  final product_color;
  final product_qty;

  Single_cart_product({this.product_name,
    this.products_on_cart_counter,
    this.product_price,
    this.product_picture,
    this.product_size,
    this.product_color,
    this.product_qty});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 7.0,
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Image.asset(
            product_picture,
            width: 40.0,
            height: 40.0,
          ),
          title: Text(product_name),
          subtitle: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
                    child: Text('Size : '),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 3.0, 20.0, 8.0),
                    child: Text(
                      product_size,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.red),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 8.0, 0.0, 8.0),
                    child: Text('Color : '),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 8.0, 12.0, 8.0),
                    child: Text(
                      product_color,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.red),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 8.0, 0.0, 8.0),
                    child: Text('Qty : '),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              elevation: 8.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              title: Text('Quantity'),
                              content: Container(
                                height: 150.0,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Choose a number',
                                    ),
                                    Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: IconButton(
                                            icon: Icon(Icons.arrow_drop_up),
                                            onPressed: () {})),
                                    Text("$product_qty"),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: IconButton(
                                          icon: Icon(Icons.arrow_drop_down),
                                          onPressed: () {}),
                                    )
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(context);
                                  },
                                  child: Text('Close'),
                                )
                              ],
                            );
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 6.0, 8.0),
                      child: Text(
                        "$product_qty",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    '\$ ' + "$product_price",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
