import 'package:flutter/material.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import 'package:food_delivery/views/home/location_screen.dart';

class TopBarWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const TopBarWidget(this.constraints, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 26,
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 20,
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
                Row(
                  children: [
                    const Text(
                      'مقصد',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LocationScreen();
                        }));
                      },
                      child: Container(
                          margin: EdgeInsets.only(
                            left: 30,
                          ),
                          child: Icon(Icons.location_on_sharp)),
                    ),
                  ],
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
                        left: 45,
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
      ],
    );
  }
}
