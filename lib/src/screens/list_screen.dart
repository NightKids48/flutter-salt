part of 'screens.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  NotificationService notifService = NotificationService();
  Future<dynamic> onReceiveNotif(int id, String? title, String? body) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title!),
          content: Text(body!),
          actions: [
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Kamu Mendapatkan $body')));
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  String nama = '';
  int bottomNavBarIndex = 0;

  void showNotif() {
    notifService.showNotif('Ini Tittlenya', 'Makan Gratis', '1');
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Kamu Jelek'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'))
              ],
            ));

    await Navigator.push(
      context,
      MaterialPageRoute<void>(
          builder: (context) => DetailProductScreen(
                productId: int.parse(payload!),
              )),
    );
  }

  @override
  void initState() {
    notifService.init((p0, p1, p2, p3) => onReceiveNotif(p0, p1, p3),
        onDidReceiveNotificationResponse);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('List Produk'), backgroundColor: Colors.teal),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavBarIndex,
          onTap: (value) {
            setState(() {
              bottomNavBarIndex = value;
            });
          },
          backgroundColor: const Color.fromARGB(255, 0, 127, 150),
          selectedItemColor: Colors.white,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'List View'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.grid_3x3), label: 'Grid View'),
          ],
        ),
        body: (bottomNavBarIndex == 0)
            ? const ListProduct()
            : const GridProduct());
  }
}

class GridProduct extends StatelessWidget {
  const GridProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      future: http.get(Uri.parse("https://fakestoreapi.com/products")),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          final products = productModelFromJson(snapshot.data!.body);
          return GridView.count(
            crossAxisCount: 2,
            children: products
                .map((e) => ProductWidget(
                      product: e,
                    ))
                .toList(),
          );
        }
        return Container();
      },
    );
  }
}

class ListProduct extends StatelessWidget {
  const ListProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      future: http.get(Uri.parse("https://fakestoreapi.com/products")),
      builder: (context, snapshot) {
        //Widget ketika loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        //Widget ketika datanya di load
        if (snapshot.hasData) {
          final products = productModelFromJson(snapshot.data!.body);

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) =>
                ProductWidget(product: products[index]),
          );
        }
        return Container();
      },
    );
  }
}
