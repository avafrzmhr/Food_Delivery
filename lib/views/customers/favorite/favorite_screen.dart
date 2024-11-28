import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/customers/favorite/bloc/favorite_list_bloc.dart';

class FavoriteListScreeen extends StatefulWidget {
  const FavoriteListScreeen({super.key});

  @override
  State<FavoriteListScreeen> createState() => _FavoriteListScreeenState();
}

class _FavoriteListScreeenState extends State<FavoriteListScreeen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteListBloc()..add(LoadFavoriteListEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Favorite Restaurants"),
        ),
        body: BlocBuilder<FavoriteListBloc, FavoriteListState>(
          builder: (context, state) {
            if (state is FavoriteListSuccess) {
              return ListView.builder(
                itemCount: state.restaurant.length, // Access the correct list
                itemBuilder: (context, index) {
                  final restaurant = state.restaurant[index];
                  return ListTile(
                    leading: Image.network(
                      restaurant.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(restaurant.name),
                    subtitle: Text(restaurant.category),
                    trailing: Text("${restaurant.averageRating ?? "N/A"} ⭐"),
                  );
                },
              );
            } else if (state is FavoriteListError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            // Default loading state
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
