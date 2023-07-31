import 'package:citisers/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
          actions: [TextButton(onPressed: () {}, child: Text("LogOut"))],
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text("signout"),
                onPressed: () async {
                  await FirebaseServices().signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, "number_page", (route) => false);
                },
              ),
              Text("${FirebaseAuth.instance.currentUser!.email}"),
              Text("${FirebaseAuth.instance.currentUser!.displayName}"),
              Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
            ],
          ),
        ));
  }
}
