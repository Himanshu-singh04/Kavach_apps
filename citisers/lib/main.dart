import 'package:citisers/database/userDatabase/mongodb.dart';
import 'package:citisers/pages/complete_profile.dart';
import 'package:citisers/pages/display_profile.dart';
import 'package:citisers/pages/home_page.dart';
import 'package:citisers/pages/number_page.dart';
import 'package:citisers/utils/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  //'This channel is used for important notifications',
  importance: Importance.high,
  playSound: true,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  await MongoDatabase.connect();
  await Firebase.initializeApp();
  runApp(main_page());
}

class main_page extends StatefulWidget {
  const main_page({super.key});

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder: (context, themeModel, _) {
          return MaterialApp(
            theme: themeModel.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            debugShowCheckedModeBanner: false,
            initialRoute: 'number_page',
            routes: {
              'number_page': (context) => number_page(),
              'home_page': (context) => home_page(),
              'complete_profile': (context) => complete_profile(),
              'display_profile': (context) => display_profile(),
            },
          );
        },
      ),
    );
  }
}
