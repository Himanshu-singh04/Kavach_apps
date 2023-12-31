import 'package:citisers/utils/color_utils.dart';
import 'package:citisers/utils/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class round_appbar extends StatefulWidget {
  const round_appbar({super.key});

  @override
  State<round_appbar> createState() => _round_appbarState();
}

class _round_appbarState extends State<round_appbar> {
  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(10),
      ),
      child: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(
              themeModel.isDarkMode ? Icons.lightbulb : Icons.lightbulb_outline,
            ),
            onPressed: () {
              themeModel.toggleTheme();
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Navigator.pushNamed(context, 'setting_page');
              Navigator.pushNamed(context, 'display_profile');
            },
          )
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
          "Citisers",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
