part of 'screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

Widget _buildEmail2() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Email',
        style: TextStyle(color: Colors.blue, fontSize: 15),
      ),
      const SizedBox(height: 5),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(colors: [Colors.black, Colors.teal]),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, blurRadius: 20, offset: Offset(0, 5))
            ]),
        height: 55,
        child: const TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(fontSize: 14, color: Colors.white),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.email, color: Colors.white),
              hintText: 'Email',
              hintStyle: TextStyle(fontSize: 17, color: Colors.white)),
        ),
      )
    ],
  );
}

Widget _buildPassword2() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Pasword',
        style: TextStyle(color: Colors.blue, fontSize: 15),
      ),
      const SizedBox(height: 5),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(colors: [Colors.teal, Colors.black]),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, blurRadius: 20, offset: Offset(0, 5))
            ]),
        height: 55,
        child: const TextField(
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          style: TextStyle(fontSize: 14, color: Colors.white),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.lock, color: Colors.white),
              suffixIcon: Icon(Icons.remove_red_eye, color: Colors.white),
              hintText: 'Password',
              hintStyle: TextStyle(fontSize: 17, color: Colors.white)),
        ),
      )
    ],
  );
}

Widget _buildText() {
  return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
    TextButton(
      onPressed: () {},
      child: const Text('Forgot Password?'),
    )
  ]);
}

Widget _buildButton2(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(colors: [Colors.black, Colors.teal]),
        boxShadow: const [
          BoxShadow(color: Colors.black, blurRadius: 20, offset: Offset(0, 5))
        ]),
    height: 40,
    child: MaterialButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ListScreen()));
        },
        child: const Text(
          'L  O  G   I   N',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        )),
  );
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.teal,
            Colors.white,
            Colors.white,
            Colors.teal,
          ])),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello Again!',
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildEmail2(),
            const SizedBox(height: 25),
            _buildPassword2(),
            const SizedBox(height: 5),
            _buildText(),
            const SizedBox(height: 35),
            _buildButton2(context)
          ],
        ),
      ),
    ));
  }
}
