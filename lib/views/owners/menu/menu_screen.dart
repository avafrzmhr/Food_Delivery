import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/owners/food/add_food_form.dart';
import 'package:food_delivery/views/owners/menu/bloc/menu_foods_bloc.dart';

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
              return ListView.builder(
                  itemCount: state.menu.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      height: 110,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 217, 209, 255),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: 85,
                            height: 85,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                state.menu[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(state.menu[index].name),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text(state.menu[index].categoryName),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'تومان ',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 112, 112, 112)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '${state.menu[index].price.toInt()}',
                                      style: const TextStyle(
                                        color: Color.fromRGBO(84, 54, 230, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.delete,
                                size: 30,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 12),
                                child: Icon(
                                  Icons.mode_edit_outline_rounded,
                                  size: 30,
                                  color: Color.fromRGBO(48, 24, 172, 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });

              //   final uniqueCategories = <String>{};
              //   final uniqueMenu = state.menu
              //       .where((item) => uniqueCategories.add(item.categoryName))
              //       .toList();

              //   return GridView.builder(
              //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2, // number of items in each row
              //         mainAxisSpacing: 15, // spacing between rows
              //         childAspectRatio: 3.2,
              //         crossAxisSpacing: 15, // spacing between columns
              //       ),
              //       padding: const EdgeInsets.all(20), // padding around the grid
              //       itemCount: uniqueMenu.length, // total number of items
              //       itemBuilder: (context, index) {
              //         return GestureDetector(
              //           onTap: () {
              //             final categoryName = uniqueMenu[index].categoryName;
              //             if (categoryName != null) {
              //               print(
              //                   "Navigating to MenuItems with categoryName: $categoryName");
              //               Navigator.push(context,
              //                   MaterialPageRoute(builder: (context) {
              //                 return MenuItems(categoryName: categoryName);
              //               }));
              //             } else {
              //               print("Error: categoryName is null");
              //             }
              //           },
              //           child: Container(
              //             decoration: BoxDecoration(
              //               color: Colors.purple.shade100,
              //               borderRadius: BorderRadius.circular(10),
              //             ),
              //             // color of grid items
              //             child: Center(
              //               child: Text(
              //                 uniqueMenu[index].categoryName,
              //                 style: const TextStyle(
              //                     fontSize: 18.0, color: Colors.white),
              //               ),
              //             ),
              //           ),
              //         );
              //       });
              // }
              // return Container();
            }
            return Container();
          }),
        ));
  }
}
