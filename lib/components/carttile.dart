import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:simple_cart/model/cartmodel.dart';

class CartTile extends StatelessWidget {
  final ShoeModel shoe;
  final void Function()? onPressed;
  const CartTile({super.key, required this.shoe, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: const BoxDecoration(color: Colors.white),
        child: ListTile(
          title: Text(
            shoe.shoeName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            shoe.shoePrice,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Image.asset(shoe.shoeImg),
          trailing:
              IconButton(onPressed: onPressed, icon: const Icon(Icons.delete)),
        ),
      ),
    );
  }
}
