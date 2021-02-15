import 'package:add_to_cart_provider/model/checkout.dart';
import 'package:add_to_cart_provider/model/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/cart.dart';

class Home extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'iphone x', price: 200),
    Item(name: 'iphone 4', price: 100),
    Item(name: 'iphone xR', price: 350),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add to Cart'),
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CheckOut(),
                    ),
                  );
                },
                icon: Icon(Icons.shopping_cart),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Consumer<Cart>(
                  builder: (context, cart, child) {
                    return Text("${cart.totalPrice}");
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) {
          return Consumer<Cart>(
            builder: (context, cart, child) {
              return ListTile(
                title: Text(items[i].name),
                trailing: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    cart.addItem(items[i]);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
