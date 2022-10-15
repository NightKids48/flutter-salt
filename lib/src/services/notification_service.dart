part of 'services.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  get localNotif => null;

  void init(
      Future<dynamic> Function(int, String?, String?, String?)? onDidReceive) {
    // ignore: unused_local_variable
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings(appIcon);

    final DarwinInitializationSettings iosSetting =
        DarwinInitializationSettings(
            requestSoundPermission: false,
            requestBadgePermission: false,
            requestAlertPermission: false,
            onDidReceiveLocalNotification: onDidReceive);

    final InitializationSettings initSetting =
        InitializationSettings(android: androidSettings, iOS: iosSetting);

    initLocalNotif(initSetting);
  }

  void initLocalNotif(InitializationSettings initSetting) async {
    await flutterLocalNotificationsPlugin.initialize(initSetting);
  }

  void showNotif(String message) async {
    AndroidNotificationDetails androidNotifDetails =
        const AndroidNotificationDetails(channelid, 'Belajar Salt',
            playSound: true);

    await localNotif.show(12345, 'Hallo', Message,
        NotificationDetails(android: androidNotifDetails));
  }
}
