import 'package:flutter/material.dart';
import 'package:food_delivery/views/customers/restaurant_page/restaurant_page.dart';

class RestaurantsListViewWidget extends StatefulWidget {
  final BoxConstraints constraints;
  final double width;
  final double height;
  final Axis scrollDirection;
  const RestaurantsListViewWidget(
      {super.key,
      required this.scrollDirection,
      required this.constraints,
      required this.height,
      required this.width});

  @override
  State<RestaurantsListViewWidget> createState() =>
      _RestaurantsListViewWidgetState();
}

class _RestaurantsListViewWidgetState extends State<RestaurantsListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: widget.scrollDirection,
      children: [
        GestureDetector(
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const RestaurantPage();
          })),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 144, 142, 145),
                ),
                width: widget.width,
                height: widget.height,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(48, 24, 172, 1),
                ),
                width: widget.width,
                height: 150,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 15,
          height: 15,
        ),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 144, 142, 145),
              ),
              width: widget.width,
              height: widget.height,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(48, 24, 172, 1),
              ),
              width: widget.width,
              height: 150,
            ),
          ],
        ),
      ],
    );
  }
}
