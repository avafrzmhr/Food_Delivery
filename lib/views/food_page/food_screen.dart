import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/views/food_page/widgets/bottom_add_cart_widget.dart';
import 'package:food_delivery/views/restaurant_page/widgets/topbar_picture_widget.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 235, 235),
        body: Stack(
          children: [
            Column(
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
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.star_rate_rounded,
                      color: Color.fromRGBO(48, 24, 172, 1),
                      size: 32,
                    ),
                    const Text(
                      '4.7',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.2,
                    ),
                    const Icon(
                      Icons.av_timer_rounded,
                      color: Color.fromRGBO(48, 24, 172, 1),
                    ),
                    const Text(
                      '20 min',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
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
                Container(
                  padding: const EdgeInsets.only(top: 15, right: 15),
                  alignment: Alignment.topRight,
                  child: const Text(
                    'نظرات',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(48, 24, 172, 1),
                    ),
                  ),
                ),
                // ListView(

                // ),
              ],
            ),
            BottomAddCardWidget(constraints),
          ],
        ),
      );
    });
  }
}
