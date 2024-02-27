import 'package:flutter/material.dart';

import 'cartmodel.dart';

class Cart extends ChangeNotifier {
  //shows shoe llist
  List<ShoeModel> getShoe = [
    ShoeModel(
        shoeName: 'Air Jordan 1 mid ',
        shoeImg: 'assets/afm.png',
        shoePrice: '\$160.00',
        descriptions:
            'Inspired by the original AJ1, this mid-top edition maintains the iconic look you love while choice colors and crisp leather give it a distinct identity.'),
    ShoeModel(
        shoeName: 'Nike Pegasus Trail',
        shoeImg: 'assets/pegasus.png',
        shoePrice: '\$160.99',
        descriptions:
            'The Nike Pegasus Trail 4 GORE-TEX is your running companion for those days when the weather turns. Its waterproof GORE-TEX layer helps keep your feet dry, and less rubber in the outsole creates a smooth transition from road to trail without breaking stride.'),
    ShoeModel(
        shoeName: 'Metcon',
        shoeImg: 'assets/metcon.png',
        shoePrice: '\$230.00',
        descriptions:
            'When your workouts wade into the nitty gritty, the Nike Free Metcon 5 can meet you in the depths, help you dig deep to find that final ounce of force and come out of the other side on a high. It matches style with substance, forefoot flexibility with backend stability, perfect for flying through a cardio day or enhancing your agility. A revamped upper offers easier entry with a collar made just for your ankle.'),
    ShoeModel(
        shoeName: 'Nike Air Max 90',
        shoeImg: 'assets/am.png',
        shoePrice: '\$250.00',
        descriptions:
            'Lace up and feel the legacy. These AM90s will keep up with you on all your adventures thanks to a mix of GORE-TEX and mesh materials. Worn by presidents, revolutionized through collabs and celebrated through rare colorways, the Waffle sole, striking visuals and Nike Air cushioning keep it alive and well.'),
    ShoeModel(
        shoeName: 'Nike Dunk Low',
        shoeImg: 'assets/dl.png',
        shoePrice: '\$90.00',
        descriptions:
            'The radiance lives on in the Nike Dunk Low, the b-ball icon that puts a playful twist on what you know best: stitched overlays, bold colors and the perfect amount of flash to make you shine. Several cheerful details nod to the ubiquitous shopping bags of NYC bodegas, making sure you "have a nice day."'),
  ];

  //list of item in user cart
  List<ShoeModel> userCart = [];

  //get list of shoe for sale
  List<ShoeModel> getShoeList() {
    return getShoe;
  }

  //get list for ussercart
  List<ShoeModel> getUserCart() {
    return userCart;
  }

  //add user cart
  void addItemToCart(ShoeModel shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove user cart
  void removeItemFromCart(ShoeModel shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
