part of 'models.dart';

class ProductModel {
  final String? productName;
  final String? productDesc;
  final String? imageUrl;
  final double? productPrice;

  ProductModel(
      {this.productName, this.productDesc, this.imageUrl, this.productPrice});
}

List<ProductModel> products = [
  ProductModel(
      productName: 'Katana',
      productDesc: 'Hyorinmaru',
      imageUrl:
          'https://cdn.icon-icons.com/icons2/332/PNG/256/katana_35313.png',
      productPrice: 50000),
  ProductModel(
      productName: 'Katana',
      productDesc: 'Hyorinmaru',
      imageUrl:
          'https://cdn.icon-icons.com/icons2/332/PNG/256/Katana_-_Saido_35314.png',
      productPrice: 50000)
];
