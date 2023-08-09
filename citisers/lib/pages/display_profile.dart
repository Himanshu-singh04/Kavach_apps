import 'package:flutter/material.dart';

class UserProfile {
  final String name;
  final String email;

  UserProfile({required this.name, required this.email});
}

class display_profile extends StatefulWidget {
  const display_profile({super.key});

  @override
  State<display_profile> createState() => _display_profileState();
}

class _display_profileState extends State<display_profile> {
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  final UserProfile user =
      UserProfile(name: 'John Doe', email: 'johndoe@example.com');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: display_profile(),
          preferredSize: Size.fromHeight(kToolbarHeight)),
    );
  }
}
