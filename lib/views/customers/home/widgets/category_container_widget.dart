import 'package:flutter/material.dart';
import 'package:food_delivery/views/customers/category_shops/category_shops_screen.dart';

class CategoryContainerWidget extends StatefulWidget {
  final String text;
  final String name;
  final BoxConstraints constraints;
  CategoryContainerWidget(
    this.constraints, {
    super.key,
    required this.text,
    required this.name,
  });

  @override
  State<CategoryContainerWidget> createState() =>
      _CategoryContainerWidgetState();
}

class _CategoryContainerWidgetState extends State<CategoryContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategoryShopsScreen();
        }));
      },
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  // color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    widget.name,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            widget.text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
