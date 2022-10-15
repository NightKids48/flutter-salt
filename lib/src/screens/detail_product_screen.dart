part of 'screens.dart';

class DetailProductScreen extends StatelessWidget {
  final int productId;

  const DetailProductScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Detail Produk'),
        ),
        body: FutureBuilder<http.Response>(
            future: http
                .get(Uri.parse("https://fakestoreapi.com/products/$productId")),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                final detailProduct =
                    detailProductModelFromJson(snapshot.data!.body);
                return Column(
                  children: [
                    Image.network(detailProduct.image!,
                        height: 250, width: 250),
                    const SizedBox(height: 10),
                    Text(detailProduct.title!,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text("Rp.${detailProduct.price!}"),
                    const SizedBox(height: 5),
                    Text("Rp.${detailProduct.description!}",
                        style: const TextStyle(fontSize: 15),
                        textAlign: TextAlign.justify),
                  ],
                );
              }
              return Container();
            }));
  }
}
