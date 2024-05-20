import 'package:flutter/material.dart';
import 'package:rest_apis_learning/screens/get_apis_screens/photos_list_api/photos_list.dart';
import 'package:rest_apis_learning/screens/get_apis_screens/post_list_api/post_list.dart';
import 'package:rest_apis_learning/screens/get_apis_screens/product_list_api/product_list_api.dart';
import 'package:rest_apis_learning/screens/get_apis_screens/user_list_api/user_list_api.dart';
import 'package:rest_apis_learning/widgets/custom_elevatedbutton.dart';

class GetApisScreens extends StatelessWidget {
  const GetApisScreens({super.key});

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
              //Post List API
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
              //Photos List API
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
              //Product List API
              CustomElevatedButton(
                text: 'Product List API',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductList(),
                    ),
                  );
                },
              ),
              // User List API
              CustomElevatedButton(
                  text: 'User List API',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserList(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
