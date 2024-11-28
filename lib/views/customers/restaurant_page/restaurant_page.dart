import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/customers/favorite/bloc/favorite_list_bloc.dart';
import 'package:food_delivery/views/customers/food_page/bloc/add_to_cart_bloc.dart';
import 'package:food_delivery/views/customers/restaurant_page/favorite_bloc/favorite_bloc.dart';
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
  bool _isfavorite = false;
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
          BlocProvider(
            create: (context) => AddToCartBloc(),
          ),
          BlocProvider(
            create: (context) => FavoriteBloc(),
          ),
          BlocProvider(
            create: (context) =>
                FavoriteListBloc()..add(LoadFavoriteListEvent()),
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
              BlocListener<FavoriteBloc, FavoriteState>(
                listener: (context, state) {
                  if (state is FavoriteSuccess) {
                    setState(() {
                      _isfavorite = true;
                    });
                  }
                },
                child: BlocBuilder<FavoriteListBloc, FavoriteListState>(
                  builder: (context, state1) {
                    if (state1 is FavoriteListSuccess) {
                      final isFavorite = state1.restaurant
                          .any((restaurant) => restaurant.id == widget.id);
                      final favoriteId = isFavorite
                          ? state1.id[state1.restaurant.indexWhere(
                              (restaurant) => restaurant.id == widget.id)]
                          : null;

                      return BlocBuilder<FavoriteBloc, FavoriteState>(
                        builder: (context, state) {
                          return Container(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(right: 30),
                            child: IconButton(
                                iconSize: 35,
                                onPressed: () {
                                  !isFavorite
                                      ? BlocProvider.of<FavoriteBloc>(context)
                                          .add(AddFavorite(widget.id))
                                      : BlocProvider.of<FavoriteBloc>(context)
                                          .add(DelFavorite(favoriteId!));
                                },
                                icon: Icon(
                                  !isFavorite
                                      ? Icons.favorite_border_rounded
                                      : Icons.favorite_rounded,
                                  color: Colors.red,
                                )),
                          );
                        },
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
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
