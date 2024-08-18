import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/owners/menu/bloc/menu_foods_bloc.dart';

class MenuItems extends StatefulWidget {
  const MenuItems({super.key});

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drinks'),
      ),
      body: BlocProvider(
        create: (context) => MenuFoodsBloc()..add(const LoadMenuFoodsEvent()),
        child: BlocBuilder<MenuFoodsBloc, MenuFoodsState>(
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
                        color: Color.fromARGB(255, 220, 218, 255),
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
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  '\$${state.menu[index].price}',
                                  style: const TextStyle(
                                    color: Color.fromRGBO(48, 24, 172, 1),
                                  ),
                                ),
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
            }
            return Container();
          },
        ),
      ),
    );
  }
}
