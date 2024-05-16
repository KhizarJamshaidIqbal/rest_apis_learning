import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_apis_learning/models/products_model.dart';
import 'package:rest_apis_learning/widgets/animated_custom_text.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<ProductModel> productList = [];

  Future<List<ProductModel>> getProductApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/6a9ddd3c-7af1-4531-85b0-d80faf979790'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        productList.add(ProductModel.fromJson(i as Map<String, dynamic>));
      }
      return productList;
    } else {
      return productList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getProductApi(),
        builder: (context, snapshot) {
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
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10.0,
                          ),
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              // productList[index]
                              //     .products![0]
                              //     .images![2]
                              //     .toString(),
                              productList[index].products != null &&
                                      productList[index].products!.isNotEmpty &&
                                      productList[index].products![0].images !=
                                          null &&
                                      productList[index]
                                              .products![0]
                                              .images!
                                              .length >
                                          2
                                  ? productList[index]
                                      .products![0]
                                      .images![2]
                                      .toString()
                                  : 'https://ibb.co/Qj1gjvg',
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(productList[index].name.toString()),
                              Text(productList[index].location.toString()),
                            ],
                          )
                        ],
                      ), //products
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: productList[index].products!.length,
                            itemBuilder: (context, i) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * .4,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.builder(
                                      itemCount: productList[index]
                                          .products![i]
                                          .images!
                                          .length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index2) {
                                        return SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .95,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10.0)),
                                              child: Image.network(
                                                productList[index]
                                                    .products![i]
                                                    .images![index2]
                                                    .toString(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  ListTile(
                                      title: Text(productList[index]
                                          .products![i]
                                          .name
                                          .toString()),
                                      subtitle: Row(
                                        children: [
                                          Text(productList[index]
                                              .products![i]
                                              .category
                                              .toString()),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              "\$ ${productList[index].products![i].price}"),
                                        ],
                                      ),
                                      trailing: const Icon(
                                        CupertinoIcons.heart_fill,
                                        color: Colors.red,
                                      )),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      )
                    ],
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
