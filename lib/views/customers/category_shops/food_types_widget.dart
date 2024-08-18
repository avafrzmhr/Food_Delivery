import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/model/restaurant/menu_response.dart';

class FoodTypesWidget extends StatefulWidget {
  final BoxConstraints constraints;
  final List<Menu> menu;
  const FoodTypesWidget(this.constraints, {super.key, required this.menu});

  @override
  State<FoodTypesWidget> createState() => _FoodTypesWidgetState();
}

class _FoodTypesWidgetState extends State<FoodTypesWidget> {
  @override
  Widget build(BuildContext context) {
    final uniqueCategories = <String>{};
    final uniqueMenu = widget.menu
        .where((item) => uniqueCategories.add(item.categoryName))
        .toList();

    return SizedBox(
      height: widget.constraints.maxHeight * 0.06,
      child: ListView.builder(
        dragStartBehavior: DragStartBehavior.start,
        itemCount: uniqueMenu.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              width: 100,
              child: Center(
                  child: Text(
                uniqueMenu[index].categoryName,
                style: TextStyle(
                  color: Color.fromRGBO(48, 24, 172, 1),
                ),
              )),
            ),
          );
        },
      ),
    );
  }
}
