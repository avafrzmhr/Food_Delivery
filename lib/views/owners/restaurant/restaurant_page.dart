import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/owners/restaurant/add_restaurant_screen.dart';
import 'package:food_delivery/views/owners/restaurant/res_bloc/restaurant_bloc.dart';

class OwnerRestaurantPage extends StatefulWidget {
  const OwnerRestaurantPage({super.key});

  @override
  State<OwnerRestaurantPage> createState() => _OwnerRestaurantPageState();
}

class _OwnerRestaurantPageState extends State<OwnerRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocProvider(
        create: (context) =>
            OwnerRestaurantBloc()..add(LoadOwnerRestaurantEvent()),
        child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            label: const Text('رستوران خود را اضافه کنید'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddRestaurantScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add,
                color: Color.fromRGBO(48, 24, 172, 1), size: 28),
          ),
          body: BlocBuilder<OwnerRestaurantBloc, OwnerRestaurantState>(
              builder: (context, state) {
            if (state is OwnerRestaurantSuccess) {
              return Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  width: constraints.maxWidth * 0.8,
                  height: constraints.maxHeight * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 233, 219, 255),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: constraints.maxWidth * 0.8,
                        height: constraints.maxHeight * 0.3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            state.restaurant.data[0].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        state.restaurant.data[0].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        state.restaurant.data[0].addressName,
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        state.restaurant.data[0].phoneNumber,
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
              );
            }

            return Container();
          }),
        ),
      );
    });
  }
}
