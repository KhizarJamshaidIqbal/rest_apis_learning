import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_apis_learning/models/PhotosModel.dart';
import 'package:http/http.dart' as http;
import 'package:rest_apis_learning/widgets/animated_custom_text.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<PhotosModel> photoslist = [];
  Future<List<PhotosModel>> getPhotosApi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        PhotosModel photosModel = PhotosModel(
          id: i['id'].toString(),
          title: i['title'].toString(),
          url: i['url'].toString(),
        );
        photoslist.add(photosModel);
      }
      return photoslist;
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPhotosApi(),
      builder: (context, AsyncSnapshot<List<PhotosModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 10.0,
                ),
                AnimatedCustomText(text: 'Loading...'),
              ],
            ),
          );
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                    "Number of Note: ${snapshot.data![index].id}",
                  ),
                  subtitle: Text(
                    snapshot.data![index].title,
                  ),
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50),
                      // image: const DecorationImage(
                      //   image: NetworkImage(
                      //       'https://via.placeholder.com/600/771796'),
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    width: 50,
                    height: 50,
                    child: Image.network(
                      snapshot.data![index].url,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Text('Some errors occurred!');
                      },
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text('No data found'),
          );
        }
      },
    );
  }
}
