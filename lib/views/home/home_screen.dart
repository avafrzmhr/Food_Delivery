import 'package:flutter/material.dart';
import 'package:food_delivery/views/home/widgets/category_container_widget.dart';
import 'package:food_delivery/views/home/widgets/search_bar_widget.dart';
import 'package:food_delivery/views/home/widgets/top_bar_widget.dart';
import 'package:food_delivery/views/home/widgets/tops_listview_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          TopBarWidget(constraints),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SearchBarWidget(searchController, constraints),
          ),
          CategoryContainerWidget(constraints),
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
            child: TopsListViewWidget(constraints),
          ),
        ],
      );
    });
  }
}
