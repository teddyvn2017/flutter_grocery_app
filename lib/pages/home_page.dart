// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/components/grocery_item_tile.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';
import '../pages/cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CartPage();
            }));
          },
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          child: Icon(Icons.shopping_bag),
        ),
        body: SafeArea(
          child: Column(
            //good morning

            children: [
              const SizedBox(height: 48),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text('Good morning,'),
              ),
              const SizedBox(height: 4),

              //Let's order fresh items for you
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text('Let\'s order fresh items for you,',
                    style: GoogleFonts.notoSerif(
                        fontSize: 36, fontWeight: FontWeight.bold)),
              ),
              //divider
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Divider(),
              ),

              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Fresh items every day',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ),

              //fresh items + grid
              Expanded(child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                      itemCount: value.shopItems.length,
                      padding: EdgeInsets.all(12),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.3,
                      ),
                      itemBuilder: (context, index) {
                        return GroceryItemTile(
                          itemName: value.shopItems[index][0],
                          itemPrice: value.shopItems[index][1],
                          imagePath: value.shopItems[index][2],
                          color: value.shopItems[index][3],
                          onPressed: () {
                            Provider.of<CartModel>(context, listen: false)
                                .addtoCart(index);
                          },
                        );
                      });
                },
              )),
            ],
          ),
        ));
  }
}
