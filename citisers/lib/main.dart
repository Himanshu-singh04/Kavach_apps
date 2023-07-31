import 'package:citisers/home_page.dart';
import 'package:citisers/number_page.dart';
import 'package:citisers/otp_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'number_page',
      routes: {
        'number_page': (context) => number_page(),
        'otp_page': (context) => otp_page(),
        'home_page': (context) => home_page()
      },
    );
  }
}
