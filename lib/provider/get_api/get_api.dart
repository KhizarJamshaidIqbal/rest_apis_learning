import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rest_apis_learning/models/PhotosModel.dart';
import 'package:rest_apis_learning/models/PostsModel.dart';
import 'package:http/http.dart' as http;
import 'package:rest_apis_learning/models/products_model.dart';

class GetAPI with ChangeNotifier {
  //API URL
  final String _postUrl = 'https://jsonplaceholder.typicode.com/posts';
  final String _photoUrl = 'https://jsonplaceholder.typicode.com/photos';
  final String _productUrl = 'https://webhook.site/6a9ddd3c-7af1-4531-85b0-d80faf979790';
  final String _userUrl = 'https://jsonplaceholder.typicode.com/users';

  //List of posts and photos and products and users
  final List<PostsModel> _posts = [];
  final List<PhotosModel> _photos = [];
  final List<ProductModel> _product = [];
  final List _user = [];
  //Getters
  List<PostsModel> get posts => _posts;
  List<PhotosModel> get photos => _photos;
  List<ProductModel> get product => _product;
  List get user => _user;
  //Fetch posts
  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse(_postUrl));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        PostsModel postsModel = PostsModel.fromJson(i);
        _posts.add(postsModel);
      }
      notifyListeners();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  //Fetch photos
  Future<void> fetchPhotos() async {
    final response = await http.get(Uri.parse(_photoUrl));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        PhotosModel photosModel = PhotosModel(
          id: i['id'].toString(),
          title: i['title'].toString(),
          url: i['url'].toString(),
        );
        _photos.add(photosModel);
      }
      notifyListeners();
    } else {
      throw Exception('Failed to load photos');
    }
  }

  //Fetch products
  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse(_productUrl));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        ProductModel productModel =
            ProductModel.fromJson(i as Map<String, dynamic>);
        _product.add(productModel);
      }
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }

  //Fetch users
  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse(_userUrl));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        _user.add(i);
      }
      notifyListeners();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
