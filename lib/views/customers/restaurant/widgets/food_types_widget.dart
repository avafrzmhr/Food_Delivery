import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/customers/restaurant/filter_res_bloc/filter_res_foods_bloc.dart';
import 'package:food_delivery/views/customers/restaurant/res_bloc/restaurant_detail_bloc.dart';

class FoodTypesWidget extends StatefulWidget {
  final BoxConstraints constraints;
  final int id;
  final bool isCafe;

  const FoodTypesWidget({
    super.key,
    required this.constraints,
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
    return BlocBuilder<RestaurantDetailBloc, RestaurantDetailState>(
      builder: (context, state) {
        if (state is RestaurantDetailLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RestaurantDetailSuccess) {
          final uniqueCategories = <String>{};
          final menu = state.menu;
          final uniqueMenu = menu
              .where((item) => uniqueCategories.add(item.categoryName))
              .toList();

          return SizedBox(
            height: widget.constraints.maxHeight * 0.06,
            child: ListView.builder(
              itemCount: uniqueMenu.length + 1, // Add "همه" option
              scrollDirection: Axis.horizontal,
              reverse: true,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = 'همه';
                      });
                      BlocProvider.of<RestaurantDetailBloc>(context).add(
                        LoadRestaurantDetailEvent(widget.id, widget.isCafe),
                      );
                    },
                    child: _buildCategoryItem(
                      categoryName: 'همه',
                      isSelected: _selectedCategory == 'همه',
                    ),
                  );
                }

                final menuIndex = index - 1;
                final categoryName = uniqueMenu[menuIndex].categoryName;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = categoryName;
                    });
                    BlocProvider.of<FilterFoodsBloc>(context).add(
                        FilterByCategoryEvent(
                            categoryName, widget.id, widget.isCafe));
                  },
                  child: _buildCategoryItem(
                    categoryName: categoryName,
                    isSelected: _selectedCategory == categoryName,
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(child: Text('Error loading data'));
        }
      },
    );
  }

  Widget _buildCategoryItem({
    required String categoryName,
    required bool isSelected,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: isSelected ? const Color.fromRGBO(48, 24, 172, 1) : Colors.white,
      ),
      width: 100,
      child: Center(
        child: Text(
          categoryName,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : const Color.fromRGBO(48, 24, 172, 1),
          ),
        ),
      ),
    );
  }
}
