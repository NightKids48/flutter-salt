part of 'widgets.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;

  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Image.network(product.imageUrl!),
            Text(product.productName!),
            Text("Rp. ${product.productPrice}"),
            Text(product.productDesc!)
          ],
        ));
  }
}
