import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_cart/components/carttile.dart';
import 'package:simple_cart/model/cart.dart';
import 'package:simple_cart/model/cartmodel.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeShoeFromCart(ShoeModel shoe) {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.grey[300],
                title: const Text(
                  'CartPage',
                  style: TextStyle(fontSize: 25),
                ),
                centerTitle: true,
              ),
              backgroundColor: Colors.grey[300],
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: value.getUserCart().length,
                        itemBuilder: (context, index) {
                          ShoeModel individualshoe = value.getUserCart()[index];

                          return CartTile(
                            shoe: individualshoe,
                            onPressed: () => removeShoeFromCart(individualshoe),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(),
                              backgroundColor: Colors.black,
                              minimumSize: const Size.fromHeight(50)),
                          onPressed: () {
                            // showDialog(
                            //     context: context,
                            //     builder: ((context) => const AlertDialog(
                            //           title: Text('Successfully🎉'),
                            //         )));

                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Check Out',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    ),
                  ),
                ],
              ),
            ));
  }
}
