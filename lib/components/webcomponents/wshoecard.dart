import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:simple_cart/model/cartmodel.dart';
import 'package:simple_cart/views/detailspage.dart';

class WebShoeCard extends StatelessWidget {
  final String tag;
  final ShoeModel shoe;
  final void Function()? onPressed;
  const WebShoeCard(
      {super.key,
      required this.shoe,
      required this.tag,
      required this.onPressed});

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
        padding: const EdgeInsets.only(top: 50),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: 300,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FadeIn(
              duration: const Duration(seconds: 1),
              animate: true,
              child: Hero(
                tag: shoe,
                child: Image.asset(
                  shoe.shoeImg,
                  width: 250,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(8),
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shoe.shoeName,
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        shoe.shoePrice,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100)),
                        child: IconButton(
                            onPressed: onPressed,
                            icon: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                            )),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
