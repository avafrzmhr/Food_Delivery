import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/views/food_page/widgets/add_or_remove_widget.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
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
                  SizedBox(
                    width: constraints.maxWidth * 0.38,
                  ),
                  const Text(
                    'مقصد',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
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
                height: constraints.maxHeight * 0.58,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: 85,
                            height: 85,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 10),
                                child: const Text('name'),
                              ),
                              const Text(
                                'restaurant',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 8),
                                child: const Text(
                                  '\$55',
                                  style: TextStyle(
                                    color: Color.fromRGBO(48, 24, 172, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   width: constraints.maxWidth * 0.2,
                          // ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: const Color.fromARGB(255, 211, 218, 255),
                                child: const Icon(
                                  Icons.remove_rounded,
                                  size: 30,
                                  color: Color.fromRGBO(48, 24, 172, 1),
                                ),
                              ),
                              const Text(
                                '2',
                                style: TextStyle(
                                  color: Color.fromRGBO(48, 24, 172, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: const Color.fromARGB(255, 211, 218, 255),
                                child: const Icon(
                                  Icons.add_rounded,
                                  size: 30,
                                  color: Color.fromRGBO(48, 24, 172, 1),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: constraints.maxWidth * 0.8,
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(48, 24, 172, 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20, top: 25),
                        child: const Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: Container(
                          width: constraints.maxWidth * 0.5,
                          padding: const EdgeInsets.only(bottom: 15),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'پرداخت',
                              style: TextStyle(
                                color: Color.fromRGBO(48, 24, 172, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
