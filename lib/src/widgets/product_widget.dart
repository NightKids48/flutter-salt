part of 'widgets.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;

  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailProductScreen(productId: product.id!)));
        },
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.teal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      product.image!,
                      height: 300,
                      width: 300,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      product.title!,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text("Rp.${product.price!}",
                        style: const TextStyle(fontSize: 20)),
                    const SizedBox(height: 10),
                    Text(product.description!,
                        style: const TextStyle(fontSize: 15),
                        textAlign: TextAlign.justify)
                  ],
                ),
              )),
        ));
  }
}
