// Module imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/rendering.dart';

// My own imports
import 'package:shopapp_tut/components/horizontal_list_view.dart';
import 'package:shopapp_tut/components/Products.dart';
import 'package:shopapp_tut/pages/cart.dart';
import 'package:shopapp_tut/components/cart_products.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var products_on_cart = Single_cart_product().products_on_cart_counter;

    Widget image_carousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/shoe.jpg'),
          AssetImage('images/clothes.jpg'),
          AssetImage('images/50off.jpg'),
          AssetImage('images/baby.jpg'),
        ],
        autoplay: false,
        dotSize: 4.0,
        indicatorBgPadding: 4.0,
        dotBgColor: Colors.transparent,
        dotColor: Colors.red,
//        animationCurve: Curves.fastOutSlowIn,
//        animationDuration: Duration(milliseconds: 1000),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: Text('Shoppy',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: Stack(
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              })
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // ***Header***
            UserAccountsDrawerHeader(
              accountName: Text('Muhammadali Qorbanzadeh'),
              accountEmail: Text('muhammadaliqorbanzadeh@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.lightBlueAccent,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(color: Colors.red),
            ),

            // ***Body***
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Colors.deepOrange),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My account'),
                leading: Icon(Icons.person, color: Colors.deepOrange),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My orders'),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.deepOrange,
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              child: ListTile(
                title: Text('Shopping cart'),
                leading: Icon(Icons.shopping_cart, color: Colors.deepOrange),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favorites'),
                leading: Icon(Icons.favorite, color: Colors.red),
              ),
            ),
            Divider(),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.blueGrey,
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 400.0,
                        width: 280.0,
                        child: AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: Text('About me'),
                          content: ListTile(
                            title: Text('M-Qorbanzadeh'),
                            subtitle: Text('Mobile Developer',),
                            leading: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle
                              ),
                              child: Image.asset(
                                'images/aboutme_me.jpg',
                                fit: BoxFit.cover,
                              ),
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
                        ),
                      );
                    });
              },
              child: ListTile(
                title: Text('About'),
                leading: Icon(
                  Icons.help,
                  color: Colors.indigo,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          // ***Image Carousel Begins here***
          image_carousel,
          // ***Padding Widget***
          Padding(
              padding: const EdgeInsets.all(10.0), child: Text('Categories')),
          // Horizontal list View Begins here
          HorizontalList(),

          Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                'Recent Products',
                style: TextStyle(
                  color: Colors.black87,
                ),
              )),

          // ***Grid View***
          Container(
            height: 360.0,
            child: Products(),
          )
        ],
      ),
    );
  }
}
