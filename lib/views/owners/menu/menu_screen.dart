import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/owners/food/add_food_form.dart';
import 'package:food_delivery/views/owners/menu/bloc/menu_foods_bloc.dart';
import 'package:food_delivery/views/owners/menu/menu_items.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MenuFoodsBloc()..add(const LoadMenuFoodsEvent()),
        child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            label: const Text('آیتم اضافه کنید'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddFoodForm(),
                ),
              );
            },
            icon: const Icon(Icons.add,
                color: Color.fromRGBO(48, 24, 172, 1), size: 28),
          ),
          body: BlocBuilder<MenuFoodsBloc, MenuFoodsState>(
              builder: (context, state) {
            if (state is MenuFoodsSuccess) {
              final uniqueCategories = <String>{};
              final uniqueMenu = state.menu
                  .where((item) => uniqueCategories.add(item.categoryName))
                  .toList();

              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // number of items in each row
                    mainAxisSpacing: 15, // spacing between rows
                    childAspectRatio: 3.2,
                    crossAxisSpacing: 15, // spacing between columns
                  ),
                  padding: const EdgeInsets.all(20), // padding around the grid
                  itemCount: uniqueMenu.length, // total number of items
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const MenuItems();
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.purple.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // color of grid items
                        child: Center(
                          child: Text(
                            uniqueMenu[index].categoryName,
                            style: const TextStyle(
                                fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  });
            }
            return Container();
          }),
        ));
  }
}
