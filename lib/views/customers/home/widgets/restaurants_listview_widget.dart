import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/data/model/restaurant/restaurant_response.dart';
import 'package:food_delivery/views/customers/home/res_bloc/restaurant_bloc.dart';
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
    return BlocProvider(
      create: (context) => RestaurantBloc()..add(LoadRestaurantEvent()),
      child: BlocBuilder<RestaurantBloc, RestaurantState>(
        builder: (context, state) {
          if (state is RestaurantSuccess) {
            Restaurant restaurants = state
                .restaurants; // Assuming `state.restaurants` is a list of Restaurant objects.

            return ListView.builder(
              itemCount: restaurants.data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
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
                        child: Image.network(restaurants.data[index].image),
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
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
