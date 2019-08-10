import 'package:flutter/material.dart';
import 'package:flutter_shop/screens/cart_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/providers/cart.dart';
import 'package:flutter_shop/widgets/badge.dart';
import 'package:flutter_shop/widgets/products_grid.dart';
import 'package:flutter_shop/widgets/app_drawer.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My shop"),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Only favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show all'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (context, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
              color: null,
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => {
                Navigator.of(context).pushNamed(CartScreen.routeName)
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
