import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_apis_learning/provider/get_api/get_api.dart';
import 'package:rest_apis_learning/widgets/animated_custom_text.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<GetAPI>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetAPI>(builder: (context, api, child) {
      return api.user.isEmpty
          ? const Center(
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
            )
          : ListView.builder(
              itemCount: api.user.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      "Name: ${api.user[index]['name'].toString()}",
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Address: ${api.user[index]['address']['city']}",
                        ),
                        Text(
                          "Geo Code: ${api.user[index]['address']['geo']['lat']}, ${api.user[index]['address']['geo']['lng']}",
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Center(
                        child: Text(
                          api.user[index]['id'].toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
    });
  }
}
