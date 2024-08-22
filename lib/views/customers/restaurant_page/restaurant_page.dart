import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/customers/restaurant_page/filter_cafe_bloc/filter_cafe_foods_bloc.dart';
import 'package:food_delivery/views/customers/restaurant_page/cafe_bloc/cafe_detail_bloc.dart';
import 'package:food_delivery/views/customers/restaurant_page/widgets/food_types_widget.dart';
import 'package:food_delivery/views/customers/restaurant_page/res_bloc/restaurant_detail_bloc.dart';
import 'package:food_delivery/views/customers/restaurant_page/widgets/food_card_widget.dart';
import 'package:food_delivery/views/customers/restaurant_page/widgets/topbar_picture_widget.dart';
import 'package:food_delivery/views/customers/restaurant_page/filter_res_bloc/filter_res_foods_bloc.dart';

class RestaurantPage extends StatefulWidget {
  final String resName;
  final int id;
  final String imageSrc;
  final bool isCafe;

  const RestaurantPage({
    super.key,
    required this.resName,
    required this.imageSrc,
    required this.id,
    required this.isCafe,
  });

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RestaurantDetailBloc()
              ..add(LoadRestaurantDetailEvent(widget.id)),
          ),
          BlocProvider(
            create: (context) =>
                CafeDetailBloc()..add(LoadCafeDetailEvent(widget.id)),
          ),
          BlocProvider(
            create: (context) => FilterRestaurantFoodsBloc(),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 224, 213, 255),
            title: Text(widget.resName),
          ),
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
                  ],
                ),
              ),
              !widget.isCafe
                  ? BlocBuilder<RestaurantDetailBloc, RestaurantDetailState>(
                      builder: (context, state) {
                        if (state is RestaurantDetailSuccess) {
                          return FoodTypesWidget(
                            id: widget.id,
                            constraints: constraints,
                            menu: state.menu,
                            isCafe: widget.isCafe,
                          );
                        }
                        return Container(); // Can show a loading indicator here if needed
                      },
                    )
                  : BlocBuilder<CafeDetailBloc, CafeDetailState>(
                      builder: (context, state) {
                        if (state is CafeDetailSuccess) {
                          return FoodTypesWidget(
                            id: widget.id,
                            constraints: constraints,
                            menu: state.menu,
                            isCafe: widget.isCafe,
                          );
                        }
                        return Container(); // Can show a loading indicator here if needed
                      },
                    ),
              const SizedBox(height: 15),
              !widget.isCafe
                  ? BlocBuilder<FilterRestaurantFoodsBloc,
                      FilterRestaurantFoodsState>(
                      builder: (context, state) {
                        if (state is FilterRestaurantFoodsSuccess) {
                          return Expanded(
                            child: FoodCardWidget(
                              menu: state.menu,
                              resName: widget.resName,
                            ),
                          );
                        } else if (state is FilterRestaurantFoodsInitial) {
                          // Show the full menu when "همه" is selected
                          return BlocBuilder<RestaurantDetailBloc,
                              RestaurantDetailState>(
                            builder: (context, state) {
                              if (state is RestaurantDetailSuccess) {
                                return Expanded(
                                  child: FoodCardWidget(
                                    menu: state.menu,
                                    resName: widget.resName,
                                  ),
                                );
                              }
                              return Container(); // Can show a loading indicator here if needed
                            },
                          );
                        }
                        return Container(); // Fallback empty container
                      },
                    )
                  : BlocBuilder<FilterCafeFoodsBloc, FilterCafeFoodsState>(
                      builder: (context, state) {
                        if (state is FilterCafeFoodsSuccess) {
                          return Expanded(
                            child: FoodCardWidget(
                              menu: state.menu,
                              resName: widget.resName,
                            ),
                          );
                        } else if (state is FilterCafeFoodsInitial) {
                          // Show the full menu when "همه" is selected
                          return BlocBuilder<CafeDetailBloc, CafeDetailState>(
                            builder: (context, state) {
                              if (state is CafeDetailSuccess) {
                                return Expanded(
                                  child: FoodCardWidget(
                                    menu: state.menu,
                                    resName: widget.resName,
                                  ),
                                );
                              }
                              return Container(); // Can show a loading indicator here if needed
                            },
                          );
                        }
                        return Container(); // Fallback empty container
                      },
                    )
            ],
          ),
        ),
      );
    });
  }
}
