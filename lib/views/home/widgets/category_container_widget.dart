import 'package:flutter/material.dart';

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
        color: Colors.red,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
