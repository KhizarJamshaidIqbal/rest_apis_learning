import 'package:flutter/cupertino.dart';
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
    Provider.of<GetAPI>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GetAPI>(
        builder: (context, api, child) {
          return api.product.isEmpty
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
                  itemCount: api.product.length,
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
                                  api.product[index].products != null &&
                                          api.product[index].products!
                                              .isNotEmpty &&
                                          api.product[index].products![0]
                                                  .images !=
                                              null &&
                                          api.product[index].products![0]
                                                  .images!.length >
                                              2
                                      ? api.product[index].products![0]
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
                                  Text(api.product[index].name.toString()),
                                  Text(api.product[index].location.toString()),
                                ],
                              )
                            ],
                          ), //products

                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: api.product[index].products!.length,
                                itemBuilder: (context, i) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .4,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ListView.builder(
                                          itemCount: api.product[index]
                                              .products![i].images!.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index2) {
                                            return SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .95,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                  child: Image.network(
                                                    api
                                                        .product[index]
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
                                          title: Text(api
                                              .product[index].products![i].name
                                              .toString()),
                                          subtitle: Row(
                                            children: [
                                              Text(api.product[index]
                                                  .products![i].category
                                                  .toString()),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                  "\$ ${api.product[index].products![i].price}"),
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
        },
      ),
    );
  }
}
