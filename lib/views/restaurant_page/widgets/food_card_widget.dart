import 'package:flutter/material.dart';
import 'package:food_delivery/views/food_page/food_screen.dart';

class FoodCardWidget extends StatefulWidget {
  const FoodCardWidget({super.key});

  @override
  State<FoodCardWidget> createState() => _FoodCardWidgetState();
}

class _FoodCardWidgetState extends State<FoodCardWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const FoodScreen();
              })),
              child: Container(
                margin: const EdgeInsets.only(right: 15, top: 15),
                width: 200,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5, top: 10),
                      child: Text(
                        'Burger Ferguson',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        'Spicy Restaurant',
                        style: TextStyle(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$40',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            Icons.add_circle,
                            color: Color.fromRGBO(48, 24, 172, 1),
                            size: 35,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 15, top: 15),
              width: 200,
              height: 220,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 156, 68, 68),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
