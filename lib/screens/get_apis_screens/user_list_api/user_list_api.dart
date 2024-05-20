import 'package:flutter/material.dart';
import 'package:rest_apis_learning/screens/get_apis_screens/user_list_api/list_screen/list_screen.dart';
class UserList extends StatelessWidget {
  const UserList({super.key});

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