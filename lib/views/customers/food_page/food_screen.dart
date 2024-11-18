import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/data/model/restaurant/menu_response.dart';
import 'package:food_delivery/views/customers/food_page/bloc/add_to_cart_bloc.dart';
import 'package:food_delivery/views/customers/food_page/widgets/bottom_add_cart_widget.dart';
import 'package:food_delivery/views/customers/restaurant_page/widgets/topbar_picture_widget.dart';

class FoodScreen extends StatefulWidget {
  // final String imageSrc;
  // final String foodName;
  // final String desc;
  // final double price;
  // final int rate;
  // const FoodScreen({
  //   super.key,
  //   required this.desc,
  //   required this.price,
  //   required this.imageSrc,
  //   required this.foodName,
  //   required this.rate,
  // });
  Menu food;
  FoodScreen(this.food);

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddToCartBloc(),
      child: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.food.name),
            backgroundColor: Color.fromARGB(255, 224, 213, 255),
          ),
          backgroundColor: const Color.fromARGB(255, 235, 235, 235),
          body: Stack(
            children: [
              Column(
                children: [
                  TopBarPictureWidget(
                    constraints,
                    imageSrc: widget.food.image,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.food.name,
                    style: const TextStyle(
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
                      Text(
                        widget.food.averageRating.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Text(
                      textAlign: TextAlign.right,
                      widget.food.desc,
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
              BottomAddCardWidget(
                  widget.food.id, widget.food.price, constraints),
            ],
          ),
        );
      }),
    );
  }
}
