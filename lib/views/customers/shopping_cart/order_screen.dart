import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/main.dart';
import 'package:food_delivery/views/customers/payment/payment_screen.dart';
import 'package:food_delivery/views/customers/shopping_cart/order_bloc/order_bloc.dart';
import 'package:food_delivery/views/location/location_screen.dart';

class OrderScreen extends StatefulWidget {
  final int id;
  const OrderScreen(this.id, {super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String? selectedAddress; // Variable to store the selected address

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderBloc>(
      create: (context) => OrderBloc()..add(LoadOrderEvent(widget.id)),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'Order',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if (state is OrderLoading) {
              // Show loading indicator during API call
              return const Center(child: CircularProgressIndicator());
            } else if (state is OrderError) {
              // Show error message and retry button if the API call fails
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error: ${state.message}',
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Retry loading order
                        context
                            .read<OrderBloc>()
                            .add(LoadOrderEvent(widget.id));
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else if (state is OrderSuccess) {
              // Render UI with order data once loaded
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.order.data.detail.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(top: 10),
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
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    color: const Color.fromARGB(
                                        255, 211, 218, 255),
                                    child: IconButton(
                                      iconSize: 20,
                                      onPressed: () {},
                                      icon: const Icon(Icons.remove_rounded),
                                      color:
                                          const Color.fromRGBO(48, 24, 172, 1),
                                    ),
                                  ),
                                  Text(
                                    '${state.order.data.detail[index].quantity}',
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
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    color: const Color.fromARGB(
                                        255, 211, 218, 255),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add_rounded),
                                      iconSize: 20,
                                      color:
                                          const Color.fromRGBO(48, 24, 172, 1),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(state.order.data.detail[index].name),
                                  Container(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'تومان',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(48, 24, 172, 1),
                                          ),
                                        ),
                                        Text(
                                          '${state.order.data.detail[index].price}',
                                          style: const TextStyle(
                                            color:
                                                Color.fromRGBO(48, 24, 172, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  // Address Selector
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LocationScreen(
                              lat: MyApp.sharedPreferences.getDouble('Lat') ??
                                  MyApp.defaultLat,
                              lang: MyApp.sharedPreferences.getDouble('Long') ??
                                  MyApp.defaultLong,
                              cityName: '',
                            ),
                          ),
                        ).then((_) {
                          setState(() {
                            selectedAddress =
                                MyApp.sharedPreferences.getString('Address') ??
                                    '';
                          });
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Color.fromRGBO(48, 24, 172, 1),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'ادرس خود را انتخاب کنید',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Show Selected Address
                  if (selectedAddress != null)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.home,
                            color: Color.fromRGBO(48, 24, 172, 1),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              selectedAddress!,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),

                  // Summary and Continue Button
                  Container(
                    color: Colors.grey[100],
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('جمع سفارش:',
                                style: TextStyle(fontSize: 14)),
                            Text(
                              '${state.order.data.totalOrder} تومان',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('هزینه پست:',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(48, 24, 172, 1),
                                )),
                            Text(
                              '${state.order.data.deliveryPrice} تومان',
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(48, 24, 172, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(height: 24, color: Colors.grey),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('مبلغ قابل پرداخت:',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Text(
                              '${state.order.data.totalPrice} تومان',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(48, 24, 172, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {
                            BlocProvider.of<OrderBloc>(context).add(
                              AddCustomerAddress(
                                selectedAddress ?? '',
                                MyApp.sharedPreferences.getDouble('Lat') ??
                                    MyApp.defaultLat,
                                MyApp.sharedPreferences.getDouble('Long') ??
                                    MyApp.defaultLong,
                                widget.id,
                                state.order.data.id,
                              ),
                            );
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    PaymentScreen(state.order.data.id),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'ادامه',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const SizedBox(); // Safe fallback for unexpected states
          },
        ),
      ),
    );
  }
}
