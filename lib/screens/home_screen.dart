import 'package:flutter/material.dart';

import '../Model/product_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  ProductModel? productModel;


  @override
  void initState() {
    getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text('Products'),
        ),
        body: productModel != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Popular",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          const SizedBox(
                            width: 215,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "See all",
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(0.5),
                                  fontSize: 13),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey.withOpacity(0.5),
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemExtent: 100,
                          scrollDirection: Axis.horizontal,
                          itemCount: productModel!.products!.length,
                          itemBuilder: (context, index) {
                            var currProduct = productModel!.products![index];
                            return ClipRRect(
                              borderRadius: BorderRadius.zero,
                              child: Container(
                                height: 200,
                                width: 100,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                        currProduct.images![0].toString(),

                                        fit: BoxFit.fill,
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            currProduct.title!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            currProduct.description!,
                                            softWrap: false,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.grey
                                                    .withOpacity(0.5)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Categories & Discount %",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                          const SizedBox(
                            width: 120,
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                                color: Colors.grey.withOpacity(0.5),
                                fontSize: 13),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey.withOpacity(0.5),
                            size: 15,
                          )
                        ]),
                        SizedBox(
                          height: 180,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: productModel!.products!.length,
                              itemBuilder: (context, index) {
                                var currProduct =
                                    productModel!.products![index];
                                return ClipRRect(
                                  borderRadius: BorderRadius.zero,

                                  child: Expanded(
                                    child: Container(
                                      height: 200,

                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.network(
                                              currProduct.images![0].toString(),
                                              fit: BoxFit.fill,
                                              height: 100,
                                              width: 190,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  currProduct.category!,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  currProduct.discountPercentage!.toInt().toString(),
                                                  softWrap: false,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.grey
                                                          .withOpacity(0.5)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Brand & Rating',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                            const SizedBox(width: 150),
                            Text(
                              "See all",
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(0.5),
                                  fontSize: 13),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey.withOpacity(0.5),
                              size: 15,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 250,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: productModel!.products!.length,
                              itemBuilder: (context, index) {
                                var currProduct =
                                    productModel!.products![index];
                                return ClipRRect(
                                  borderRadius: BorderRadius.zero,
                                  child: Container(
                                    height: 200,
                                    width: 100,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.network(
                                            currProduct.images![0].toString(),
                                            fit: BoxFit.fill,
                                            height: 100,
                                            width: 100,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                currProduct.brand!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                currProduct.rating.toString()!,
                                                softWrap: false,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey
                                                        .withOpacity(0.5)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }

  getProduct() async {
    var myUrl = "https://dummyjson.com/products";
    var data = await http.get(Uri.parse(myUrl));

    if (data.statusCode == 200) {
      var jsonData = jsonDecode(data.body);
      productModel = ProductModel.fromJson(jsonData);

      print(jsonData);


      setState(() {});

      print("jsonData: $jsonData");
    } else {
      print("response not fetched,due to ${data.statusCode}");
    }
  }
}
