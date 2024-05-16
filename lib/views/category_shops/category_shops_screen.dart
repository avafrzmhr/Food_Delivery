import 'package:flutter/material.dart';
import 'package:food_delivery/views/home/bottom_navigation_provider.dart';
import 'package:food_delivery/views/home/widgets/bottom_navigation_bar_widget.dart';
import 'package:food_delivery/views/home/widgets/top_bar_widget.dart';
import 'package:provider/provider.dart';

class CategoryShopsScreen extends StatefulWidget {
  const CategoryShopsScreen({super.key});

  @override
  State<CategoryShopsScreen> createState() => _CategoryShopsScreenState();
}

class _CategoryShopsScreenState extends State<CategoryShopsScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Column(
          children: [
            TopBarWidget(constraints),
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
    });
  }
}
