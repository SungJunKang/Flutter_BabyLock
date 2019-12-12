import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  void initState() {
    var androidSetting = AndroidInitializationSettings('@drawable/icon_babylock.png');
    var iosSetting = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(androidSetting, iosSetting);

    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future showNotificationWithSound() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your channel id', 'your channel name', 'your channel description',
      sound: 'slow_spring_board',
      importance: Importance.Max,
      priority: Priority.High
    );

    var iosPlatformChannelSpecifics = IOSNotificationDetails(sound: 'slow_spring.board.aiff');

    var platformChannelSpecifics = NotificationDetails(androidPlatformChannelSpecifics, iosPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.show(
      0,
      'BabyLock 알림',
      'BabyLock가 활성화되었습니다. 잠금을 해제하려면 알림을 눌러주세요.',
      platformChannelSpecifics,
      payload: 'BabyLock',
    );
  }