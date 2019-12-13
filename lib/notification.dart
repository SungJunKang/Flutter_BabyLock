import 'package:babylock/playlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AlertNotification{
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  BuildContext context;

  AlertNotification({this.context});

  void initState() {
    var androidSetting = AndroidInitializationSettings('icon_babylock.png');
    var iosSetting = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(androidSetting, iosSetting);

    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new PlayList(url: "https://babylock.herokuapp.com/", title: "babylock")),
    );
  }

  Future showNotificationWithSound(BuildContext buildContext) async {

    context = buildContext;

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      '999', 'BabyLock', 'BabyLock',
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
}