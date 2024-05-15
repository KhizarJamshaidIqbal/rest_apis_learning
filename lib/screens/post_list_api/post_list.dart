import 'package:flutter/material.dart';
import 'package:rest_apis_learning/screens/post_list_api/list_screen/list_screen.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

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
