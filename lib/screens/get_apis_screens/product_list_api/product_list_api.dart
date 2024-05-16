import 'package:flutter/material.dart';
import 'package:rest_apis_learning/screens/get_apis_screens/product_list_api/list_screen/list_screen.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListScreen(),
          ),
        ],
      ),
    );
  }
}
