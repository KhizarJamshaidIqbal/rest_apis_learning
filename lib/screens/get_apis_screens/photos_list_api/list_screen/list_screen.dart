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
    Provider.of<GetAPI>(context, listen: false).fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetAPI>(builder: (context, api, child) {
      return api.photos.isEmpty
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
              itemCount: api.photos.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      "Number of Note: ${api.photos[index].id}",
                    ),
                    subtitle: Text(
                      api.photos[index].title,
                    ),
                    leading: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          api.photos[index].url,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Text('Some errors occurred!');
                          },
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
