import 'package:flutter/material.dart';
import 'package:rest_apis_learning/screens/photos_list_api/list_screen/list_screen.dart';

class PhotosList extends StatelessWidget {
  const PhotosList({super.key});

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