import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final TextEditingController searchController;
  const SearchBarWidget(this.searchController, this.constraints, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: constraints.maxWidth * 0.9,
        height: 50,
        decoration: BoxDecoration(
            color: const Color(0xFFe9eaec),
            borderRadius: BorderRadius.circular(15)),
        child: TextField(
          textAlign: TextAlign.end,
          cursorColor: const Color(0xFF000000),
          controller: searchController,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                color: const Color(0xFF000000).withOpacity(0.5),
              ),
              hintText: "جستجو",
              border: InputBorder.none),
        ),
      ),
    );
  }
}
