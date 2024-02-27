import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_cart/components/shoebtn.dart';
import 'package:simple_cart/model/cart.dart';
import 'package:simple_cart/model/cartmodel.dart';

class ShoeDetails extends StatefulWidget {
  final ShoeModel shoe;
  final String tag;
  const ShoeDetails({super.key, required this.shoe, required this.tag});

  @override
  State<ShoeDetails> createState() => _ShoeDetailsState();
}

class _ShoeDetailsState extends State<ShoeDetails> {
  bool isLiked = false;
  void addShoeToCart(ShoeModel shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Successfully Added'),
              content: Text('Check Your Cart'),
            ));
  }

  final List<bool> buttonStates = List.generate(8, (index) => false);
  final avaliableSizes = const [
    '8.5',
    '9',
    '9.5',
    '10',
    '10.5',
    '11',
    '11.5',
    '12',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: Colors.grey[300],
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                scrolledUnderElevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLiked = !isLiked;
                          });
                        },
                        child: isLiked
                            ? const Icon(
                                Icons.favorite_sharp,
                                color: Colors.red,
                              )
                            : const Icon(Icons.favorite_outline_outlined)),
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Hero(
                            tag: widget.shoe,
                            child: Image.asset(
                              widget.shoe.shoeImg,
                              height: 180,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            'assets/logo.png',
                            height: 50,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              widget.shoe.shoeName,
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Center(
                              child: Text(
                            widget.shoe.shoePrice,
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                          const SizedBox(
                            height: 30,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Size',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'UK',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'US',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'EU',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 60,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: avaliableSizes.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: ShoeBtn(
                                      size: avaliableSizes[index],
                                      isSelected: buttonStates[index],
                                      onPressed: () {
                                        setState(() {
                                          buttonStates[index] =
                                              !buttonStates[index];
                                        });
                                      },
                                    ));
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Descriptions',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w800),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 25,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.shoe.descriptions,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(60),
                            shape: const RoundedRectangleBorder(),
                            backgroundColor: const Color(0xff000000)),
                        onPressed: () => addShoeToCart(widget.shoe),
                        child: const Text(
                          'Add to Bag',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ));
  }
}
