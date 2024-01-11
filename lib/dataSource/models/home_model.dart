class HomeModel {
  bool status;
  HomeModelData data;
  HomeModel({required this.status, required this.data});
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
        status: json['status'], data: HomeModelData.fromJson(json['data']));
  }
}

class HomeModelData {
  List<BannersModel> banners = [];
  List<ProductsModel> products = [];

  HomeModelData.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((banner) {
      banners.add( BannersModel.fromJson(banner));
    });
    json['products'].forEach((product) {
      products.add(ProductsModel.fromJson(product));
    });
  }
}

class BannersModel {
  int id;
  String image;
  BannersModel({required this.id, required this.image});

  factory BannersModel.fromJson(Map<String, dynamic> json) {
    return BannersModel(id: json['id'], image: json['image']);
  }
}

class ProductsModel {
  int id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String image;
  String name;
  bool inFavorites;
  bool inCart;

  ProductsModel(
      {required this.id,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.image,
      required this.name,
      required this.inCart,
      required this.inFavorites});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      price:json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      inCart: json['in_cart'],
      inFavorites: json['in_favorites'],
    );
  }
}
