import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/data/model/restaurant/menu_response.dart';
import 'package:food_delivery/views/customers/food/food_screen.dart';

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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
          itemCount: widget.menu.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 15, // spacing between rows
            crossAxisSpacing: 5,
            childAspectRatio: 4 / 5,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FoodScreen(
                  rate: widget.menu[index].averageRating,
                  desc: widget.menu[index].desc,
                  foodName: widget.menu[index].name,
                  id: widget.menu[index].id,
                  imageSrc: widget.menu[index].image,
                  price: widget.menu[index].price,
                );
              })),
              child: Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 130,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            widget.menu[index].image,
                            fit: BoxFit.cover,
                          ),
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.menu[index].price.toInt()}',
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
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
