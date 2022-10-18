part of 'services.dart';

class NotificationService {
  late FlutterLocalNotificationsPlugin localNotif =
      FlutterLocalNotificationsPlugin();

  void init(
      Future<dynamic> Function(int, String?, String?, String?)? onDidReceive,
      Function(NotificationResponse)? onDidReceiveNotificationRespone) {
    const AndroidInitializationSettings androidSetings =
        AndroidInitializationSettings('app_icon');

    final DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
            requestSoundPermission: false,
            requestBadgePermission: false,
            requestAlertPermission: false,
            onDidReceiveLocalNotification: onDidReceive);

    final InitializationSettings initSetting =
        InitializationSettings(android: androidSetings, iOS: iosSettings);

    tz.initializeTimeZones();

    initLocalNotif(initSetting, onDidReceiveNotificationRespone);
  }

  void initLocalNotif(InitializationSettings initSetting,
      Function(NotificationResponse)? onDidReceiveNotificationRespone) async {
    await localNotif.initialize(initSetting,
        onDidReceiveNotificationResponse: onDidReceiveNotificationRespone);
  }

  void showNotif(String tittle, String message, String idProduct) async {
    AndroidNotificationDetails androidNotifDetail =
        const AndroidNotificationDetails(channelId, 'Belajar Salt',
            playSound: true);

    DarwinNotificationDetails iosNotifDetail =
        const DarwinNotificationDetails();

    await localNotif.show(12345, 'Helllo', message,
        NotificationDetails(android: androidNotifDetail, iOS: iosNotifDetail),
        payload: idProduct);
  }

  void showNotifBirthday(
      String tittle, String message, String idProduct) async {
    AndroidNotificationDetails androidNotifDetail =
        const AndroidNotificationDetails(channelId, 'Belajar Salt',
            playSound: true);

    DarwinNotificationDetails iosNotifDetail =
        const DarwinNotificationDetails();

    await localNotif.zonedSchedule(
        12345,
        tittle,
        message,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
        NotificationDetails(android: androidNotifDetail, iOS: iosNotifDetail),
        payload: idProduct,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        payload: idProduct);
  }
}
