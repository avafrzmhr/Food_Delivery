import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/customers/home/res_bloc/restaurant_bloc.dart';
import 'package:food_delivery/views/customers/restaurant_page/restaurant_page.dart';

class RestaurantsListViewWidget extends StatefulWidget {
  final BoxConstraints constraints;
  final double width;
  final double height;
  final Axis scrollDirection;

  const RestaurantsListViewWidget({
    super.key,
    required this.scrollDirection,
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
    return BlocProvider(
      create: (context) => RestaurantBloc()..add(LoadRestaurantEvent()),
      child: BlocBuilder<RestaurantBloc, RestaurantState>(
        builder: (context, state) {
          if (state is RestaurantSuccess) {
            final restaurants = state.restaurants;
            return ListView.builder(
              dragStartBehavior: DragStartBehavior.start,
              scrollDirection: widget.scrollDirection,
              physics: const BouncingScrollPhysics(),
              itemCount: restaurants.data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return RestaurantPage(
                      imageSrc: restaurants.data[index].image,
                      resName: restaurants.data[index].name,
                      id: restaurants.data[index].id,
                    );
                  })),
                  child: Stack(
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
                                  restaurants.data[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5, top: 8),
                              child: Text(
                                restaurants.data[index].name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //       horizontal: 5, vertical: 20),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Text(restaurants.data[index].deliveryPrice
                            //           .toString()),
                            //       Text(restaurants.data[index].averageRating
                            //           .toString()),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
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
