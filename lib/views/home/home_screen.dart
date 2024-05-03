import 'package:flutter/material.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import 'package:food_delivery/views/home/widgets/category_container_widget.dart';
import 'package:food_delivery/views/home/widgets/search_bar_widget.dart';
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
      return Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 26,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 30,
                  ),
                  height: 40,
                  width: 40,
                  child: Assets.icons.svgexport17.svg(),
                ),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'مقصد',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        const Text(
                          'آدرس',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: constraints.maxWidth * 0.12,
                          ),
                          width: 10,
                          height: 10,
                          child: Assets.icons.svgexport23.svg(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
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
        ),
      );
    });
  }
}
