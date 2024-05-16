// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class ProductModel {
  String? name;
  String? location;
  String? website;
  List<Products>? products;

  ProductModel({this.name, this.location, this.website, this.products});

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'];
    website = json['website'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['location'] = this.location;
    data['website'] = this.website;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? name;
  String? category;
  double? price;
  String? currency;
  String? description;
  List<String>? images;
  List<String>? sizes;
  List<String>? colors;
  String? material;

  Products(
      {this.name,
      this.category,
      this.price,
      this.currency,
      this.description,
      this.images,
      this.sizes,
      this.colors,
      this.material});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    category = json['category'];
    price = json['price'];
    currency = json['currency'];
    description = json['description'];
    images = json['images'].cast<String>();
    sizes = json['sizes'].cast<String>();
    colors = json['colors'].cast<String>();
    material = json['material'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['category'] = this.category;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['description'] = this.description;
    data['images'] = this.images;
    data['sizes'] = this.sizes;
    data['colors'] = this.colors;
    data['material'] = this.material;
    return data;
  }
}
