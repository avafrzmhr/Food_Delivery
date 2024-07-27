import 'package:flutter/material.dart';
import 'package:food_delivery/data/model/restaurant/menu_response.dart';
import 'package:food_delivery/views/customers/food_page/food_screen.dart';

class FoodCardWidget extends StatefulWidget {
  final List<Menu> menu;
  final String resName;
  const FoodCardWidget({super.key, required this.resName, required this.menu});

  @override
  State<FoodCardWidget> createState() => _FoodCardWidgetState();
}

class _FoodCardWidgetState extends State<FoodCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.menu.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 15, // spacing between rows
          crossAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FoodScreen(
                imageSrc: widget.menu[index].image,
                resName: widget.resName,
              );
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
                  Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.only(top: 10, right: 8),
                    child: Text(
                      widget.menu[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      widget.resName,
                      style: const TextStyle(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.menu[index].price.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const Icon(
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
          );
        });
  }
}
