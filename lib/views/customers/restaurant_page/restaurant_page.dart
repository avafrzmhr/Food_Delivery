import 'package:flutter/material.dart';
import 'package:food_delivery/views/customers/category_shops/food_types_widget.dart';
import 'package:food_delivery/views/customers/restaurant_page/widgets/food_card_widget.dart';
import 'package:food_delivery/views/customers/restaurant_page/widgets/topbar_picture_widget.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 235, 235),
        body: Column(
          children: [
            TopBarPictureWidget(constraints),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Spicy restaurant',
              style: TextStyle(
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
                'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
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
            FoodTypesWidget(constraints),
            const SizedBox(
              height: 15,
            ),
            const Expanded(
              child: FoodCardWidget(),
            ),
          ],
        ),
      );
    });
  }
}
