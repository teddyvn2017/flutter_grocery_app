// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text('My Cart',
                        style: GoogleFonts.notoSerif(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ))),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.all(12),
                      itemCount: value.cartItems.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                  leading: Image.asset(
                                    value.cartItems[index][2],
                                    height: 36,
                                  ),
                                  title: Text(value.cartItems[index][0]),
                                  subtitle:
                                      Text('\$${value.cartItems[index][1]}'),
                                  trailing: IconButton(
                                    onPressed: () => Provider.of<CartModel>(
                                            context,
                                            listen: false)
                                        .removefromCart(index),
                                    icon: Icon(Icons.cancel),
                                  )),
                            ));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(36),
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total price:',
                                style: TextStyle(
                                    color: Colors.green[100],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                value.totalprice().toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade100),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Text(
                                'Pay now',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
