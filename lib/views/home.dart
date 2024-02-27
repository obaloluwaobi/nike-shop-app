import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:simple_cart/components/shoecard.dart';
import 'package:simple_cart/components/webcomponents/wshoecard.dart';
import 'package:simple_cart/model/cart.dart';
import 'package:simple_cart/model/cartmodel.dart';
import 'package:simple_cart/views/shopping_cart.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void addShoeToCart(ShoeModel shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Successfully Added'),
              content: Text('Check Your Cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Scaffold(
              drawer: Drawer(
                backgroundColor: Colors.grey[300],
                child: ListView(
                  children: [
                    DrawerHeader(
                        child: Column(
                      children: [
                        Container(
                            height: 100,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/socials/my.png')),
                              shape: BoxShape.circle,
                            )
                            //   child: CircleAvatar(
                            //     backgroundImage:
                            //         AssetImage('assets/socials/my.png'),
                            //   ),
                            ),
                        const Text(
                          'obaloluwa obidoyin',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            const url = 'https://twitter.com/oba_obidoyin';
                            if (await canLaunch(url)) {
                              launch(url,
                                  forceWebView: true, enableJavaScript: true);
                            }
                          },
                          child: CircleAvatar(
                            child: Image.asset(
                              'assets/socials/x.png',
                              width: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            const url = 'https://github.com/obaloluwaobi';
                            if (await canLaunch(url)) {
                              launch(url,
                                  forceWebView: true, enableJavaScript: true);
                            }
                          },
                          child: CircleAvatar(
                            child: Image.asset(
                              'assets/socials/gb.png',
                              width: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            const url =
                                'https://www.linkedin.com/in/obaloluwa-obidoyin-4b8941229';
                            if (await canLaunch(url)) {
                              launch(url,
                                  forceWebView: true, enableJavaScript: true);
                            }
                          },
                          child: CircleAvatar(
                            child: Image.asset(
                              'assets/socials/ln.png',
                              width: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            const url = 'https://instagram.com/oba_obidoyin';
                            if (await canLaunch(url)) {
                              launch(url,
                                  forceWebView: true, enableJavaScript: true);
                            }
                          },
                          child: CircleAvatar(
                            child: Image.asset(
                              'assets/socials/ig.png',
                              width: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              appBar: AppBar(
                leading: Builder(builder: (context) {
                  return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  );
                }),
                elevation: 0,
                scrolledUnderElevation: 0,
                centerTitle: true,
                title: Image.asset(
                  'assets/logo.png',
                  height: 50,
                ),
                actions: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CartPage()));
                        },
                        icon: const Icon(Icons.shopping_bag_outlined),
                      ))
                ],
              ),
              body: LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Best Shoes',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.sort_outlined))
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          itemCount: value.getShoeList().length,
                          itemBuilder: (context, int index) {
                            ShoeModel shoe = value.getShoeList()[index];
                            return ShoeCard(
                              tag: 'img${shoe.shoeImg[index]}',
                              shoe: shoe,
                              onPressed: () => addShoeToCart(shoe),
                            );
                          }),
                    ),
                  ]);
                } else {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Best Sellers',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.sort_outlined))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 400,
                        decoration: const BoxDecoration(),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            itemCount: value.getShoeList().length,
                            itemBuilder: (context, int index) {
                              ShoeModel shoe = value.getShoeList()[index];
                              return WebShoeCard(
                                tag: 'img${shoe.shoeImg[index]}',
                                shoe: shoe,
                                onPressed: () => addShoeToCart(shoe),
                              );
                            }),
                      ),
                    ],
                  );
                }
              }),
            ));
  }
}
