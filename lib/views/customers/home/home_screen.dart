import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/data/repository/location_repository.dart';
import 'package:food_delivery/data/source/location_source.dart';
import 'package:food_delivery/providers.dart';
import 'package:food_delivery/views/customers/home/widgets/category_container_widget.dart';
import 'package:food_delivery/views/customers/home/widgets/search_bar_widget.dart';
import 'package:food_delivery/views/customers/home/widgets/top_bar_widget.dart';
import 'package:food_delivery/views/customers/home/widgets/restaurants_listview_widget.dart';
import 'package:food_delivery/views/location/bloc/location_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<Providers>().init(context);
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          TopBarWidget(
            constraints: constraints,
            isOnline: false,
          ),
          SearchBarWidget(constraints),
          Padding(
            padding: EdgeInsets.only(top: constraints.maxHeight * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryContainerWidget(constraints, text: 'سوپرمارکت'),
                CategoryContainerWidget(constraints, text: 'کافه'),
                CategoryContainerWidget(constraints, text: 'رستوران'),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'مشاهده همه',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Text(
                  'برترین ها',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(right: 15),
                child: RestaurantsListViewWidget(
                  scrollDirection: Axis.horizontal,
                  constraints: constraints,
                  width: constraints.maxWidth * 0.8,
                  height: constraints.maxHeight * 0.3,
                )),
          ),
        ],
      );
    });
  }
}
