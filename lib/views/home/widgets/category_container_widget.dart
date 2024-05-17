import 'package:flutter/material.dart';
import 'package:food_delivery/views/category_shops/category_shops_screen.dart';

class CategoryContainerWidget extends StatefulWidget {
  final BoxConstraints constraints;
  const CategoryContainerWidget(this.constraints, {super.key});

  @override
  State<CategoryContainerWidget> createState() =>
      _CategoryContainerWidgetState();
}

class _CategoryContainerWidgetState extends State<CategoryContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 35),
      width: widget.constraints.maxWidth,
      height: widget.constraints.maxHeight * 0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(48, 24, 172, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CategoryShopsScreen();
              }));
            },
            child: Container(
              width: widget.constraints.maxWidth * 0.28,
              height: widget.constraints.maxHeight * 0.18,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Container(
            width: widget.constraints.maxWidth * 0.28,
            height: widget.constraints.maxHeight * 0.18,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Container(
            width: widget.constraints.maxWidth * 0.28,
            height: widget.constraints.maxHeight * 0.18,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}
