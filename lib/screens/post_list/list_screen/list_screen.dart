import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_apis_learning/models/PostsModel.dart';
import 'package:http/http.dart' as http;

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<PostsModel> postsList = [];

  Future<List<PostsModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postsList.add(PostsModel.fromJson(i));
      }
      return postsList;
    } else {
      return postsList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getPostApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text('Loading...'),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: postsList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        postsList[index].id.toString(),
                      ),
                    ),
                    title: Text(
                      postsList[index].title.toString(),
                      style:const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      postsList[index].body.toString(),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Failed to fetch data'),
            );
          }
        },
      ),
    );
  }
}
