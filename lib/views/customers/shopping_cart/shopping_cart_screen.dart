import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/customers/food_page/bloc/add_to_cart_bloc.dart';
import 'package:food_delivery/views/customers/payment/bloc/payment_bloc.dart';
import 'package:food_delivery/views/customers/payment/payment_screen.dart';
import 'package:food_delivery/views/customers/shopping_cart/bloc/cart_bloc.dart';

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
            return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
              if (state is CartSuccess) {
                var cartItem;
                final totalPrice = state.cart.fold<double>(
                  0,
                  (sum, item) => sum + (item.food.price * item.quantity),
                );

                return Column(
                  children: [
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
                    Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.only(right: 15),
                      child: const Text(
                        'سفارش های شما',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: constraints.maxWidth * 0.85,
                      height: constraints.maxHeight * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListView.builder(
                        itemCount: state.cart.length,
                        itemBuilder: (context, index) {
                          cartItem = state.cart[index];
                          return Container(
                            margin: const EdgeInsets.all(20),
                            height: 170,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Card(
                                      margin: const EdgeInsets.only(
                                          left: 7, right: 2),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: const Color.fromARGB(
                                          255, 211, 218, 255),
                                      child: BlocBuilder<AddToCartBloc,
                                          AddToCartState>(
                                        builder: (context, state1) {
                                          return IconButton(
                                            iconSize: 20,
                                            onPressed: () {},
                                            icon: const Icon(
                                                Icons.remove_rounded),
                                            color: const Color.fromRGBO(
                                                48, 24, 172, 1),
                                          );
                                        },
                                      ),
                                    ),
                                    Text(
                                      state.cart[index].quantity.toString(),
                                      style: const TextStyle(
                                        color: Color.fromRGBO(48, 24, 172, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Card(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: const Color.fromARGB(
                                          255, 211, 218, 255),
                                      child: IconButton(
                                        onPressed: () {
                                          // BlocProvider.of<AddToCartBloc>(
                                          //         context)
                                          //     .add(AddingEvent(
                                          //         state.cart[index].id));
                                        },
                                        icon: const Icon(Icons.add_rounded),
                                        iconSize: 20,
                                        color: const Color.fromRGBO(
                                            48, 24, 172, 1),
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(state.cart[index].food.name),
                                    ),
                                    Text(
                                      state.cart[index].restaurantCart
                                          .restaurant.name,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 8),
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
                                            '${state.cart[index].food.price}',
                                            style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  48, 24, 172, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Container(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Color.fromRGBO(48, 24, 172, 1),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            'پرداخت',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  width: 85,
                                  height: 85,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      state.cart[index].food.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
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
                  ],
                );
              }
              return const CircularProgressIndicator();
            });
          },
        ),
      ),
    );
  }
}
