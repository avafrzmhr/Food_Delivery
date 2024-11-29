import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/data/model/restaurant/cart_response.dart';
import 'package:food_delivery/views/customers/shopping_cart/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:food_delivery/views/customers/payment/bloc/payment_bloc.dart';
import 'package:food_delivery/views/customers/shopping_cart/cart_bloc/cart_bloc.dart';
import 'package:food_delivery/views/customers/shopping_cart/order_screen.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartBloc()..add(const LoadCartEvent()),
        ),
        BlocProvider(
          create: (context) => AddToCartBloc(),
        ),
        BlocProvider(
          create: (context) => PaymentBloc(),
        ),
      ],
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartSuccess) {
                  // Group items by restaurant ID
                  final groupedCart = <String, List<Cart>>{};
                  for (var cartItem in state.cart) {
                    final restaurantName =
                        cartItem.restaurantCart.restaurant.name;
                    groupedCart
                        .putIfAbsent(
                          restaurantName,
                          () => [],
                        )
                        .add(cartItem);
                  }

                  return Column(
                    children: [
                      // Top bar with back button
                      Row(
                        children: [
                          Card(
                            margin: const EdgeInsets.only(top: 15, left: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              icon: const Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Color.fromRGBO(48, 24, 172, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Title
                      Container(
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.only(right: 15, top: 15),
                        child: const Text(
                          'سفارش‌های شما',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      // Cart items grouped by restaurant
                      Expanded(
                        child: ListView(
                          children: groupedCart.entries.map((entry) {
                            final restaurantName = entry.key;
                            final items = entry.value;

                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Restaurant name
                                  Row(
                                    children: [
                                      Text(
                                        restaurantName,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  // List of items for the restaurant
                                  ...items.map((item) {
                                    return Container(
                                      padding: EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(top: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        children: [
                                          // Quantity controls
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Card(
                                                margin: const EdgeInsets.only(
                                                    left: 7, right: 2),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                color: const Color.fromARGB(
                                                    255, 211, 218, 255),
                                                child: IconButton(
                                                  iconSize: 20,
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                      Icons.remove_rounded),
                                                  color: const Color.fromRGBO(
                                                      48, 24, 172, 1),
                                                ),
                                              ),
                                              Text(
                                                item.quantity.toString(),
                                                style: const TextStyle(
                                                  color: Color.fromRGBO(
                                                      48, 24, 172, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Card(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 2),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                color: const Color.fromARGB(
                                                    255, 211, 218, 255),
                                                child: IconButton(
                                                  onPressed: () {
                                                    // Handle increment action
                                                  },
                                                  icon: const Icon(
                                                      Icons.add_rounded),
                                                  iconSize: 20,
                                                  color: const Color.fromRGBO(
                                                      48, 24, 172, 1),
                                                ),
                                              )
                                            ],
                                          ),
                                          const Spacer(),
                                          // Item details
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(item.food.name),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: Row(
                                                  children: [
                                                    const Text(
                                                      'تومان',
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            48, 24, 172, 1),
                                                      ),
                                                    ),
                                                    Text(
                                                      '${item.food.price}',
                                                      style: const TextStyle(
                                                        color: Color.fromRGBO(
                                                            48, 24, 172, 1),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          // Item image
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            width: 85,
                                            height: 85,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.network(
                                                item.food.image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(
                                              48, 24, 172, 1),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return OrderScreen(
                                                items.first.restaurantCart.id);
                                          }));
                                        },
                                        child: const Text(
                                          'پرداخت',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        ),
      ),
    );
  }

  // Expanded(
  //   child: Container(
  //     width: constraints.maxWidth * 0.8,
  //     margin: const EdgeInsets.symmetric(vertical: 15),
  //     decoration: BoxDecoration(
  //       color: const Color.fromRGBO(48, 24, 172, 1),
  //       borderRadius: BorderRadius.circular(30),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.end,
  //       children: [
  //         Container(
  //           padding:
  //               const EdgeInsets.only(right: 20, top: 25),
  //           child: Text(
  //             'مجموع: ${totalPrice.toStringAsFixed(2)} تومان',
  //             style: const TextStyle(
  //               color: Colors.white,
  //               fontSize: 20,
  //             ),
  //           ),
  //         ),
  //         const Spacer(),
  //         BlocBuilder<PaymentBloc, PaymentState>(
  //           builder: (context, state2) {
  //             return Center(
  //               child: Container(
  //                 width: constraints.maxWidth * 0.5,
  //                 padding: const EdgeInsets.only(bottom: 15),
  //                 child: ElevatedButton(
  //                   style: ElevatedButton.styleFrom(
  //                     backgroundColor: Colors.white,
  //                     padding: const EdgeInsets.symmetric(
  //                         vertical: 20),
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius:
  //                           BorderRadius.circular(15),
  //                     ),
  //                   ),
  //                   onPressed: () {
  //                     BlocProvider.of<PaymentBloc>(context)
  //                         .add(LoadPaymentEvent(cartItem));
  //                     if (state2 is PaymentSuccess) {
  //                       Navigator.push(context,
  //                           MaterialPageRoute(
  //                               builder: (context) {
  //                         return const PaymentScreen();
  //                       }));
  //                     }
  //                   },
  //                   child: const Text(
  //                     'پرداخت',
  //                     style: TextStyle(
  //                       color: Color.fromRGBO(48, 24, 172, 1),
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 17,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             );
  //           },
  //         )
  //       ],
  //     ),
  //   ),
  // ),
}
