import 'package:flutter/material.dart';
import 'package:rest_apis_learning/screens/get_apis_screens/get_apis_screens.dart';
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
                text: 'Get Api Learning',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GetApisScreens(),
                    ),
                  );
                },
              ),
              // CustomElevatedButton(
              //   text: 'Get Api Learning',
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const PhotosList(),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
