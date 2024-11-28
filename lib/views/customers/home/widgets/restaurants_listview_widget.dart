import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/customers/home/res_bloc/restaurant_bloc.dart';
import 'package:food_delivery/views/customers/restaurant_page/restaurant_page.dart';

class RestaurantsListViewWidget extends StatefulWidget {
  final BoxConstraints constraints;
  final double width;
  final double height;
  final Axis scrollDirection;
  final bool isCafe;
  final bool isBoth;

  const RestaurantsListViewWidget({
    super.key,
    required this.scrollDirection,
    required this.isCafe,
    this.isBoth = false,
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
  void initState() {
    super.initState();
    // Trigger data loading in the Bloc
    BlocProvider.of<RestaurantBloc>(context).add(
      LoadDataEvent(loadRestaurants: true, loadCafes: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RestaurantSuccess) {
          List<dynamic> listToShow = [];

          if (widget.isBoth) {
            listToShow = [...state.restaurants, ...state.cafes];
          } else if (widget.isCafe) {
            listToShow = state.cafes;
          } else {
            listToShow = state.restaurants;
          }

          return ListView.builder(
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
        } else if (state is RestaurantError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
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
