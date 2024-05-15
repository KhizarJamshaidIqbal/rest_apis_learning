import 'package:flutter/material.dart';
import 'package:rest_apis_learning/screens/photos_list_api/photos_list.dart';
import 'package:rest_apis_learning/screens/post_list_api/post_list.dart';
import 'package:rest_apis_learning/widgets/custom_elevatedbutton.dart';

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
                      builder: (context) => const PostList(),
                    ),
                  );
                },
              ),
              CustomElevatedButton(
                text: 'Photos List API',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PhotosList(),
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
