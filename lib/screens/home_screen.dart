import 'package:flutter/material.dart';
import 'package:rest_apis_learning/screens/post_list/post_list.dart';
import 'package:rest_apis_learning/widgets/custom_elevatedbutton.dart';
import 'package:rest_apis_learning/screens/post_list/list_screen/list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButton(
                text: 'Posts List API',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>const PostList(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
