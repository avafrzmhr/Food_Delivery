import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/data/model/restaurant/menu_response.dart';
import 'package:food_delivery/views/customers/restaurant_page/filter_cafe_bloc/filter_cafe_foods_bloc.dart';
import 'package:food_delivery/views/customers/restaurant_page/cafe_bloc/cafe_detail_bloc.dart';
import 'package:food_delivery/views/customers/restaurant_page/res_bloc/restaurant_detail_bloc.dart';
import 'package:food_delivery/views/customers/restaurant_page/filter_res_bloc/filter_res_foods_bloc.dart';

class FoodTypesWidget extends StatefulWidget {
  final BoxConstraints constraints;
  final List<Menu> menu;
  final int id;
  final bool isCafe;
  const FoodTypesWidget({
    super.key,
    required this.constraints,
    required this.menu,
    required this.id,
    required this.isCafe,
  });

  @override
  State<FoodTypesWidget> createState() => _FoodTypesWidgetState();
}

class _FoodTypesWidgetState extends State<FoodTypesWidget> {
  String? _selectedCategory = 'همه';
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
        itemCount: uniqueMenu.length + 1, // Increase item count by 1
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemBuilder: (context, index) {
          // Add your manual container before the list items
          if (index == 0) {
            return BlocBuilder<RestaurantDetailBloc, RestaurantDetailState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = 'همه';
                    });
                    if (!widget.isCafe) {
                      BlocProvider.of<FilterRestaurantFoodsBloc>(context)
                          .add(ResetFilterRestaurantFoodsEvent());

                      // Reload all foods (you might need this to ensure correct behavior)
                      BlocProvider.of<RestaurantDetailBloc>(context)
                          .add(LoadRestaurantDetailEvent(widget.id));
                    } else {
                      BlocProvider.of<FilterCafeFoodsBloc>(context)
                          .add(ResetFilterCafeFoodsEvent());

                      // Reload all foods
                      BlocProvider.of<CafeDetailBloc>(context)
                          .add(LoadCafeDetailEvent(widget.id));
                    }
                    // Passing null to load all foods
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: _selectedCategory == 'همه'
                          ? const Color.fromRGBO(48, 24, 172, 1)
                          : Colors.white,
                    ),
                    width: 100,
                    child: Center(
                      child: Text(
                        'همه',
                        style: TextStyle(
                          color: _selectedCategory == 'همه'
                              ? Colors.white
                              : const Color.fromRGBO(48, 24, 172, 1),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }

          // Adjust the index for uniqueMenu since we added a manual item
          final menuIndex = index - 1;
          final categoryName = uniqueMenu[menuIndex].categoryName;

          return BlocBuilder<FilterRestaurantFoodsBloc,
              FilterRestaurantFoodsState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCategory = categoryName;
                  });
                  !widget.isCafe
                      ? BlocProvider.of<FilterRestaurantFoodsBloc>(context).add(
                          LoadFilterRestaurantFoodsEvent(
                              categoryName, widget.id))
                      : BlocProvider.of<FilterCafeFoodsBloc>(context).add(
                          LoadFilterCafeFoodsEvent(categoryName, widget.id));
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: _selectedCategory == categoryName
                        ? const Color.fromRGBO(48, 24, 172, 1)
                        : Colors.white,
                  ),
                  width: 100,
                  child: Center(
                    child: Text(
                      categoryName,
                      style: TextStyle(
                        color: _selectedCategory == categoryName
                            ? Colors.white
                            : const Color.fromRGBO(48, 24, 172, 1),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
