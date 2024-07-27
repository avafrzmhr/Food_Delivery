import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/customers/category_shops/food_types_widget.dart';
import 'package:food_delivery/views/customers/restaurant_page/bloc/restaurant_detail_bloc.dart';
import 'package:food_delivery/views/customers/restaurant_page/widgets/food_card_widget.dart';
import 'package:food_delivery/views/customers/restaurant_page/widgets/topbar_picture_widget.dart';

class RestaurantPage extends StatefulWidget {
  final String resName;
  final int id;
  final imageSrc;

  const RestaurantPage(
      {super.key,
      required this.resName,
      required this.imageSrc,
      required this.id});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocProvider(
        create: (context) =>
            RestaurantDetailBloc()..add(LoadRestaurantDetailEvent(widget.id)),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 235, 235, 235),
          body: Column(
            children: [
              TopBarPictureWidget(
                constraints,
                imageSrc: widget.imageSrc,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.resName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Text(
                  'dskmnaslckscmasxjasc',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'مشاهده نظرات',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(48, 24, 172, 1),
                      ),
                    ),
                    Text(
                      '۱۰نظر',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<RestaurantDetailBloc, RestaurantDetailState>(
                builder: (context, state) {
                  if (state is RestaurantDetailSuccess) {
                    return FoodTypesWidget(
                      constraints,
                      menu: state.menu,
                    );
                  }
                  return Container();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              BlocBuilder<RestaurantDetailBloc, RestaurantDetailState>(
                  builder: (context, state) {
                if (state is RestaurantDetailSuccess) {
                  return Expanded(
                    child: FoodCardWidget(
                      menu: state.menu,
                      resName: widget.resName,
                    ),
                  );
                }
                return Container();
              }),
            ],
          ),
        ),
      );
    });
  }
}
