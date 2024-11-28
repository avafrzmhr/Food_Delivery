import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/customers/home/bottom_navigation_provider.dart';
import 'package:food_delivery/views/customers/home/res_bloc/restaurant_bloc.dart';
import 'package:food_delivery/views/customers/home/widgets/bottom_navigation_bar_widget.dart';
import 'package:food_delivery/views/customers/home/widgets/search_bar_widget.dart';
import 'package:food_delivery/views/customers/home/widgets/top_bar_widget.dart';
import 'package:food_delivery/views/customers/home/widgets/restaurants_listview_widget.dart';
import 'package:food_delivery/views/customers/restaurant_page/restaurant_page.dart';
import 'package:provider/provider.dart';

class CategoryShopsScreen extends StatefulWidget {
  final bool isCafe;

  const CategoryShopsScreen({super.key, required this.isCafe});

  @override
  State<CategoryShopsScreen> createState() => _CategoryShopsScreenState();
}

class _CategoryShopsScreenState extends State<CategoryShopsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantBloc(),
      child: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          body: Column(
            children: [
              TopBarWidget(
                constraints: constraints,
                isOnline: false,
              ),
              SearchBarWidget(
                constraints,
                onSuggestionSelected: (p0) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RestaurantPage(
                      imageSrc: p0.image,
                      resName: p0.name,
                      id: p0.id,
                      isCafe: widget.isCafe,
                    );
                  }));
                },
              ),
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
              // FoodTypesWidget(constraints),
              const SizedBox(
                height: 5,
              ),
              const Divider(),
              Container(
                margin: const EdgeInsets.only(right: 22, top: 13),
                alignment: Alignment.topRight,
                child: const Text(
                  'رستوران باز',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 15, right: constraints.maxWidth * 0.12),
                    child: Center(
                      child: RestaurantsListViewWidget(
                        isCafe: widget.isCafe,
                        scrollDirection: Axis.vertical,
                        constraints: constraints,
                        width: constraints.maxWidth * 0.75,
                        height: constraints.maxHeight * 0.25,
                      ),
                    ),
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
      }),
    );
  }
}
