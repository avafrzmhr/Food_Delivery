import 'package:flutter/material.dart';
import 'package:food_delivery/views/category_shops/food_types_widget.dart';
import 'package:food_delivery/views/home/bottom_navigation_provider.dart';
import 'package:food_delivery/views/home/widgets/bottom_navigation_bar_widget.dart';
import 'package:food_delivery/views/home/widgets/search_bar_widget.dart';
import 'package:food_delivery/views/home/widgets/top_bar_widget.dart';
import 'package:food_delivery/views/home/widgets/restaurants_listview_widget.dart';
import 'package:provider/provider.dart';

class CategoryShopsScreen extends StatefulWidget {
  const CategoryShopsScreen({super.key});

  @override
  State<CategoryShopsScreen> createState() => _CategoryShopsScreenState();
}

class _CategoryShopsScreenState extends State<CategoryShopsScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Column(
          children: [
            TopBarWidget(constraints),
            SearchBarWidget(constraints),
            Container(
              margin: const EdgeInsets.only(right: 22, top: 25),
              alignment: Alignment.topRight,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[350],
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.all(21)),
                  onPressed: () {},
                  child: const Text(
                    'مرتب سازی',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            FoodTypesWidget(constraints),
            const SizedBox(
              height: 5,
            ),
            const Divider(),
            Container(
              margin: const EdgeInsets.only(right: 22, top: 13),
              alignment: Alignment.topRight,
              child: const Text(
                'رستوران باز۲۰',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 22, top: 15),
                child: RestaurantsListViewWidget(
                  scrollDirection: Axis.vertical,
                  constraints: constraints,
                  width: constraints.maxWidth * 0.9,
                  height: constraints.maxHeight * 0.3,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Consumer<BottomNavigationProvider>(
          builder: (context, provider, child) => BottomNavigationBarWidget(
            onTap: (index) {
              setState(() {
                provider.setSelectedIndex(index);
              });
              Navigator.pop(context);
            },
          ),
        ),
      );
    });
  }
}
