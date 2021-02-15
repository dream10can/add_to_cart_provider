import 'package:add_to_cart_provider/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('checkout'),
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return ListView.builder(
            itemCount: cart.count,
            itemBuilder: (context, i) {
              return Card(
                color: Colors.blue,
                child: ListTile(
                  trailing: IconButton(
                    onPressed: () {
                      cart.removeItem(cart.getItem[i]);
                    },
                    icon: Icon(Icons.remove),
                  ),
                  title: Text(
                    cart.getItem[i].name,
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
