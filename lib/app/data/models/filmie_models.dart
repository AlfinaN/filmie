class FilmieModel {
  final String product_name, img_url, description;
  final int price;

  FilmieModel({
    required this.product_name,
    required this.img_url,
    required this.description,
    required this.price,
  });

  factory FilmieModel.fromJSON(Map parsedJson) {
    return FilmieModel(
      product_name: parsedJson['product_name'],
      img_url: parsedJson['img_url'],
      description: parsedJson['description'],
      price: parsedJson['price'],
    );
  }
}
