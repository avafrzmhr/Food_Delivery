import 'package:flutter/material.dart';

class FoodTypesWidget extends StatefulWidget {
  final BoxConstraints constraints;
  const FoodTypesWidget(this.constraints, {super.key});

  @override
  State<FoodTypesWidget> createState() => _FoodTypesWidgetState();
}

class _FoodTypesWidgetState extends State<FoodTypesWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.constraints.maxHeight * 0.07,
      child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          reverse: true,
          shrinkWrap: true,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 144, 142, 145),
                ),
                width: 100,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 144, 142, 145),
                ),
                width: 100,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 144, 142, 145),
                ),
                width: 100,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 144, 142, 145),
                ),
                width: 100,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 144, 142, 145),
                ),
                width: 100,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 144, 142, 145),
                ),
                width: 100,
              ),
            ),
          ]),
    );
  }
}
