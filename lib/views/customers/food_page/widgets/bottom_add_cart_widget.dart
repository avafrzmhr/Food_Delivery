import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/customers/food_page/bloc/add_to_cart_bloc.dart';
import 'package:food_delivery/views/customers/food_page/widgets/add_or_remove_widget.dart';

class BottomAddCardWidget extends StatefulWidget {
  final double price;
  final BoxConstraints constraints;
  final int id;

  const BottomAddCardWidget(
      {required this.id,
      required this.price,
      required this.constraints,
      super.key});

  @override
  State<BottomAddCardWidget> createState() => _BottomAddCardWidgetState();
}

class _BottomAddCardWidgetState extends State<BottomAddCardWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddToCartBloc(),
      child: Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: widget.constraints.maxHeight * 0.22,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 170, 184, 248).withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'تومان',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '${widget.price.toInt()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: const Color.fromARGB(255, 0, 7, 25),
                      ),
                      child: AddOrRemoveWidget(widget.id),
                    ),
                  ],
                ),
                BlocBuilder<AddToCartBloc, AddToCartState>(
                  builder: (context, state) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 50),
                          backgroundColor: const Color.fromRGBO(48, 24, 172, 1),
                        ),
                        onPressed: () {
                          BlocProvider.of<AddToCartBloc>(context)
                              .add(AddingEvent(widget.id));
                        },
                        child: const Text(
                          'اضافه شدن به سبد خرید',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
