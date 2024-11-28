import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/customers/food_page/bloc/add_to_cart_bloc.dart';

class AddOrRemoveWidget extends StatelessWidget {
  final int id;
  const AddOrRemoveWidget(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddToCartBloc(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BlocBuilder<AddToCartBloc, AddToCartState>(
            builder: (context, state) {
              return Card(
                shape: const CircleBorder(),
                color: Colors.grey.withOpacity(0.7),
                child: IconButton(
                  onPressed: () {
                    // BlocProvider.of<AddToCartBloc>(context)
                    //     .add(AddingEvent(id));
                  },
                  icon: const Icon(Icons.remove_rounded),
                  iconSize: 30,
                ),
              );
            },
          ),
          const Text(
            '0',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Card(
            shape: const CircleBorder(),
            color: Colors.grey.withOpacity(0.7),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_rounded),
              iconSize: 30,
            ),
          )
        ],
      ),
    );
  }
}
