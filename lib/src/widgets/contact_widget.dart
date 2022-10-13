part of 'widgets.dart';

class ContactWidgets extends StatelessWidget {
  final ContactModel data;
  const ContactWidgets({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.network(
        data.imageUrl,
        width: 65,
        height: 65,
      ),
      const SizedBox(width: 35),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(data.name),
          Text(data.phone),
        ],
      )
    ]);
  }
}
