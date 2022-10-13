part of 'screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final c = Get.put(LoginController());
  Color color = Colors.red;
  int count = 0;
  bool isLoginProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: const [],
        ),
      ),
    ));
  }
}

class LoginController {}

class Get {
  static put(LoginController loginController) {}

  static void snackbar(String s) {}
}
