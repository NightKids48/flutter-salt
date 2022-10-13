part of 'screens.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  int bottomNavBarindex = 1;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    return Scaffold(
      appBar: AppBar(
          title: const Text('List Kontak'), backgroundColor: Colors.teal),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: Colors.teal,
        currentIndex: bottomNavBarindex,
        onTap: (value) {
          setState(() {
            // ignore: avoid_print
            print('Kamu pilih pintu yang $value');
            bottomNavBarindex = value;
            // ignore: avoid_print
            print('bottomNavBarIndex kamu sudah jadi $value');
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: 'ListView'),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_3x3), label: 'GridView'),
        ],
      ),
      body:
          (bottomNavBarindex == 0) ? const ListProduct() : const GridProduct(),
    );
  }
}

class GridProduct extends StatelessWidget {
  const GridProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      children: products
          .map((e) => ProductWidget(
                product: e,
              ))
          .toList(),
    );
  }
}

class ListProduct extends StatelessWidget {
  const ListProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return ContactWidgets(
          data: contacts[index],
        );
      },
    );
  }
}
