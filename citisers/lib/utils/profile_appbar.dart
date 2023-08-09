import 'package:citisers/utils/color_utils.dart';
import 'package:flutter/material.dart';

class profile_appbar extends StatefulWidget {
  const profile_appbar({super.key});

  @override
  State<profile_appbar> createState() => _profile_appbarState();
}

class _profile_appbarState extends State<profile_appbar> {
  @override
  Widget build(BuildContext context) {
    // final themeModel = Provider.of<ThemeModel>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(10),
      ),
      child: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          // IconButton(
          //   icon: Icon(
          //     themeModel.isDarkMode ? Icons.lightbulb : Icons.lightbulb_outline,
          //   ),
          //   onPressed: () {
          //     themeModel.toggleTheme();
          //   },
          // ),
          // IconButton(
          //   icon: Icon(Icons.person),
          //   onPressed: () {
          //     // Navigator.pushNamed(context, 'setting_page');
          //     Navigator.pushNamed(context, 'complete_profile');
          //   },
          // )
        ],
        flexibleSpace: Container(
            decoration: BoxDecoration(
          color: hexStringToColor('bcb6ff'),
          // gradient: LinearGradient(
          //   colors: [hexStringToColor('7286a0'), Colors.black],
          // ),
        )),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(1),
          ),
        ),
        title: Text(
          "Profile Completion",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
