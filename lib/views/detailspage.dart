import 'package:flutter/material.dart';

import 'package:simple_cart/components/shoeview.dart';
import 'package:simple_cart/components/webcomponents/wshoeview.dart';
import 'package:simple_cart/model/cartmodel.dart';

class DetailsPage extends StatelessWidget {
  final String tag;
  final ShoeModel shoe;
  const DetailsPage({super.key, required this.tag, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth < 600) {
        return ShoeDetails(
          shoe: shoe,
          tag: tag,
        );
      } else {
        return WebShoeView(shoe: shoe, tag: tag);
      }
    }));
  }
}
