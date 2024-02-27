import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:simple_cart/model/cartmodel.dart';
import 'package:simple_cart/views/detailspage.dart';

class ShoeCard extends StatelessWidget {
  final String tag;
  final ShoeModel shoe;
  final void Function()? onPressed;
  const ShoeCard(
      {super.key,
      required this.shoe,
      required this.onPressed,
      required this.tag});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => DetailsPage(shoe: shoe, tag: tag))));
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.only(top: 20),
        height: 300,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: IconButton(
                        onPressed: onPressed,
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                        ))),
              ],
            ),
            FadeInDown(
              duration: const Duration(seconds: 1),
              animate: true,
              child: Hero(
                tag: shoe,
                child: Image.asset(
                  shoe.shoeImg,
                  width: 300,
                ),
              ),
            ),
            FadeInUp(
              child: Text(
                shoe.shoeName,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            FadeInUp(
              child: Text(
                shoe.shoePrice,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
