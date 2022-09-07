// this class handles the different routes to different screens in the application
// it first load the login screen as its initial route then change according to the user
import 'package:flutter/material.dart';

import 'package:gymapplication/screens/addShop.dart';
import 'package:gymapplication/screens/addTrainer.dart';
import 'package:gymapplication/screens/addGym.dart';
import 'package:gymapplication/screens/addGym.dart';
import 'package:gymapplication/screens/addAppointment.dart';
import 'package:gymapplication/screens/appointment.dart';

// screens

import 'package:gymapplication/screens/home.dart';

import 'package:gymapplication/screens/register.dart';

import 'package:gymapplication/screens/shop.dart';
import 'package:gymapplication/screens/trainer.dart';
import 'package:gymapplication/screens/gym.dart';

import 'package:gymapplication/screens/levels.dart';

import 'package:gymapplication/screens/diet.dart';
import 'package:gymapplication/screens/login.dart';

import 'package:workmanager/workmanager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:math';

final Map<String, Map<String, dynamic>> quotes = {
  "Diet1": {"quote": "You need to take your diet plan to stay puffed."},
  "Diet2": {
    "quote": "Its time to take your shake.",
  },
  "Diet3": {
    "quote": "Its time to workout!!",
  },
  "Diet4": {
    "quote": "Its time to stress your muscles!!",
  }
};
/* -------------------- function that sends notification -------------------- */
const simplePeriodicTask = "simplePeriodicTask";
void showNotification(v, flp) async {
  var android = AndroidNotificationDetails(
      'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
      priority: Priority.defaultPriority,
      importance: Importance.defaultImportance);
  var iOS = IOSNotificationDetails();
  var platform = NotificationDetails(android: android, iOS: iOS);
  await flp.show(0, 'Gym City', '$v', platform, payload: 'Gym City \n $v');
}

void callbackDispatcher() {
  new Workmanager().executeTask((task, inputData) async {
    FlutterLocalNotificationsPlugin flp = FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: iOS);
    flp.initialize(initSetttings);
    var random = new Random();
    var randomNumber = random.nextInt(4);
    var randomQuote = quotes.keys.toList()[randomNumber];
    var randomQuoteText = quotes[randomQuote]["quote"];
    showNotification(randomQuoteText, flp);
    return Future.value(true);
  });
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: false,
  );
  await Workmanager().registerPeriodicTask(
    "5",
    simplePeriodicTask,
    existingWorkPolicy: ExistingWorkPolicy.replace,
    frequency: Duration(minutes: 15),
    initialDelay: Duration(seconds: 5),
    constraints: Constraints(
      networkType: NetworkType.connected,
    ),
  );
  runApp(MyApp());
}

void main() async {
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gym Application',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Montserrat'),
        initialRoute: '/login',
        routes: <String, WidgetBuilder>{
          "/home": (BuildContext context) => new Home(),
          "/register": (BuildContext context) => new Register(),
          "/login": (BuildContext context) => new Login(),
          "/shop": (BuildContext context) => new Shop(),
          "/addShop": (BuildContext context) => new AddShop(),
          "/addAppointment": (BuildContext context) => new AddAppointment(),
          "/trainer": (BuildContext context) => new Trainer(),
          "/gym": (BuildContext context) => new Gym(),
          "/addTrainer": (BuildContext context) => new AddTrainer(),
          "/addGym": (BuildContext context) => new AddGym(),
          "/workout": (BuildContext context) => new Level(),
          "/appointment": (BuildContext context) => new Appointment(),
          "/diet": (BuildContext context) => new Diet(),
        });
  }
}
