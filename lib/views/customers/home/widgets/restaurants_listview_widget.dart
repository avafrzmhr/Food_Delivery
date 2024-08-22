import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/customers/home/cafe_bloc/cafe_bloc.dart';
import 'package:food_delivery/views/customers/home/res_bloc/restaurant_bloc.dart';
import 'package:food_delivery/views/customers/restaurant_page/restaurant_page.dart';

class RestaurantsListViewWidget extends StatefulWidget {
  final BoxConstraints constraints;
  final double width;
  final double height;
  final Axis scrollDirection;
  final bool isCafe;
  final bool isBoth; // New property to show both cafes and restaurants

  const RestaurantsListViewWidget({
    super.key,
    required this.scrollDirection,
    required this.isCafe,
    this.isBoth = false, // Default value is false
    required this.constraints,
    required this.height,
    required this.width,
  });

  @override
  State<RestaurantsListViewWidget> createState() =>
      _RestaurantsListViewWidgetState();
}

class _RestaurantsListViewWidgetState extends State<RestaurantsListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              RestaurantBloc()..add(const LoadRestaurantEvent()),
        ),
        BlocProvider(
          create: (context) => CafeBloc()..add(LoadCafeEvent()),
        ),
      ],
      child: BlocBuilder<CafeBloc, CafeState>(
        builder: (context, cafeState) {
          if (cafeState is CafeSuccess) {
            final cafes = cafeState.cafe;

            return BlocBuilder<RestaurantBloc, RestaurantState>(
              builder: (context, restaurantState) {
                if (restaurantState is RestaurantSuccess) {
                  final restaurants = restaurantState.restaurants;

                  List<dynamic> listToShow = [];

                  // Determine which list to show based on the widget properties
                  if (widget.isBoth) {
                    listToShow = [...restaurants.data, ...cafes.data];
                  } else if (widget.isCafe) {
                    listToShow = cafes.data;
                  } else {
                    listToShow = restaurants.data;
                  }

                  return ListView.builder(
                    dragStartBehavior: DragStartBehavior.start,
                    scrollDirection: widget.scrollDirection,
                    physics: const BouncingScrollPhysics(),
                    itemCount: listToShow.length,
                    itemBuilder: (context, index) {
                      final item = listToShow[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RestaurantPage(
                            imageSrc: item.image,
                            resName: item.name,
                            id: item.id,
                            isCafe: widget.isCafe,
                          );
                        })),
                        child: _buildItem(
                          image: item.image,
                          name: item.name,
                        ),
                      );
                    },
                  );
                }
                return Container(); // Return a loading or error widget here
              },
            );
          }
          return Container(); // Return a loading or error widget here
        },
      ),
    );
  }

  Widget _buildItem({required String image, required String name}) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 242, 240, 255),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: widget.width,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5, top: 8),
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(width: 15),
      ],
    );
  }
}
