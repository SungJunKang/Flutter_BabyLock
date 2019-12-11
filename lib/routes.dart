import 'package:flutter/material.dart';

import 'package:babylock/main.dart';
import 'package:babylock/playlist.dart';
import 'package:babylock/login_page.dart';
import 'package:babylock/tutorial.dart';

final routes = {
  '/': (BuildContext context) => LoginPage(),
  '/mainpage': (BuildContext context) => MyHomePage(),
  '/playlist': (BuildContext context) => PlayList(url: "https://babylock.herokuapp.com/", title: "babylock"), 
  '/tutorial': (BuildContext context) => Tutorial(),
};