part of 'widgets.dart';

class ButtonWidget extends StatelessWidget {
  final String caption;
  final bool isloading;
  final double? width;
  final Function()? onPressed;

  const ButtonWidget(
      {super.key,
      required this.caption,
      this.isloading = false,
      this.width,
      required this.onPressed,
      required bool isLoading});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: width ?? size.width,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        onPressed: (isloading) ? null : onPressed,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'LOGIN',
            style: TextStyle(
              color: Colors.black38,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
