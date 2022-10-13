part of 'widgets.dart';

class LifecycleWidget extends StatefulWidget {
  final Widget child;
  const LifecycleWidget({super.key, required this.child});

  @override
  State<LifecycleWidget> createState() => _LifeCycleState();
}

class _LifeCycleState extends State<LifecycleWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // ignore: avoid_print
    print('AppLifecycleState: $state');
    if (state == AppLifecycleState.resumed) {
      // ignore: avoid_print
      print('KAMU JELEK !!!');
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
