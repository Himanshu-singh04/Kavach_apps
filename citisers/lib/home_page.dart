// import 'package:citisers/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imageview360/imageview360.dart';
import 'package:marquee/marquee.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  List<AssetImage> imageList = List<AssetImage>.of([
    AssetImage("assets/1.jpg"),
    AssetImage("assets/2.jpg"),
    AssetImage("assets/3.jpg"),
    AssetImage("assets/4.jpg"),
    AssetImage("assets/5.jpg"),
    AssetImage("assets/6.jpg"),
    AssetImage("assets/7.jpg"),
    AssetImage("assets/8.jpg"),
    AssetImage("assets/9.jpg"),
    AssetImage("assets/10.jpg"),
    AssetImage("assets/11.jpg"),
    AssetImage("assets/12.jpg"),
    AssetImage("assets/13.jpg"),
    AssetImage("assets/14.jpg"),
    AssetImage("assets/15.jpg"),
    AssetImage("assets/16.jpg"),
    AssetImage("assets/17.jpg"),
    AssetImage("assets/18.jpg"),
    AssetImage("assets/19.jpg"),
    AssetImage("assets/20.jpg"),
    AssetImage("assets/21.jpg"),
    AssetImage("assets/22.jpg"),
    AssetImage("assets/23.jpg"),
    AssetImage("assets/24.jpg"),
    AssetImage("assets/25.jpg"),
    AssetImage("assets/26.jpg"),
    AssetImage("assets/27.jpg"),
    AssetImage("assets/28.jpg"),
    AssetImage("assets/29.jpg"),
    AssetImage("assets/30.jpg"),
    AssetImage("assets/31.jpg"),
    AssetImage("assets/32.jpg"),
    AssetImage("assets/33.jpg"),
    AssetImage("assets/34.jpg"),
    AssetImage("assets/35.jpg"),
    AssetImage("assets/36.jpg"),
  ]);
  bool autoRotate = true;
  int rotationCount = 2;
  int swipeSensitivity = 2;
  bool allowSwipeToRotate = true;
  RotationDirection rotationDirection = RotationDirection.anticlockwise;
  Duration frameChangeDuration = Duration(milliseconds: 50);
  bool imagePrecached = false;
  String? selectedValue;
  List<String> items = [
    'Toyota Prius',
    'Ford F-150',
    'Volvo XC90',
    'Mazda MX-5 Miata',
    'Lexus RX',
    'Porsche 911',
    'Tesla Model S',
    'Jeep Wrangler',
    'Subaru Outback',
    'Kia Soul'
  ];

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => updateImageList(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      endDrawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(child: Text("Drawer Header")),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle the onTap event when the Home item is clicked.
              // You can navigate to a new page or perform any action here.
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle the onTap event when the Home item is clicked.
              // You can navigate to a new page or perform any action here.
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle the onTap event when the Home item is clicked.
              // You can navigate to a new page or perform any action here.
            },
          ),
        ],
      )),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              color: Colors.cyan,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.deepPurpleAccent,
                    height: 50,
                    width: double.infinity,
                    child: Marquee(
                      text: 'This is a scrolling text. ',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      blankSpace: 20.0,
                      velocity: 100.0,
                      pauseAfterRound: Duration(seconds: 1),
                      startPadding: 0,
                      accelerationDuration: Duration(seconds: 1),
                      accelerationCurve: Curves.linear,
                      decelerationDuration: Duration(milliseconds: 500),
                      decelerationCurve: Curves.easeOut,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        color: Colors.black,
                        height: 175,
                        width: 175,
                      ),
                      Spacer(),
                      Container(
                        color: Colors.red,
                        height: 175,
                        width: 175,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        color: Colors.pink,
                        height: 175,
                        width: 175,
                      ),
                      Spacer(),
                      Container(
                        color: Colors.orange,
                        height: 175,
                        width: 175,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        color: Colors.green,
                        height: 175,
                        width: 175,
                      ),
                      Spacer(),
                      Container(
                        color: Colors.yellow,
                        height: 175,
                        width: 175,
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.indigo,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.white,
                    height: 100,
                    width: 100,
                  )
                ],
              ),
            ),
          ),
          SlidingUpPanel(
            panel: SingleChildScrollView(
              child: Container(
                color: Colors.cyan,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    DropdownButton<String>(
                      value: selectedValue,
                      onChanged: (newValue) {
                        setState(() {
                          selectedValue = newValue;
                        });
                      },
                      items:
                          items.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    (imagePrecached == true)
                        ? ImageView360(
                            key: UniqueKey(),
                            imageList: imageList,
                            autoRotate: true,
                            rotationCount: 1,
                            rotationDirection: RotationDirection.anticlockwise,
                            frameChangeDuration: Duration(milliseconds: 170),
                            swipeSensitivity: swipeSensitivity,
                            allowSwipeToRotate: allowSwipeToRotate,
                          )
                        : Text("Pre-Caching images..."),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.amber,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.blueGrey,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.lightBlueAccent,
                    ),
                  ],
                ),
              ),
            ),
            collapsed: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Center(
                child: Text(
                  'Slide Up',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            minHeight: 40.0,
            maxHeight: 500.0,
            boxShadow: [],
          ),
        ],
      ),
      //     ElevatedButton(
      //       child: Text("signout"),
      //       onPressed: () async {
      //         await FirebaseServices().signOut();
      //         // ignore: use_build_context_synchronously
      //         Navigator.pushNamedAndRemoveUntil(
      //             context, "number_page", (route) => false);
      //       },
      //     ),
      //     Text("${FirebaseAuth.instance.currentUser!.email}"),
      //     Text("${FirebaseAuth.instance.currentUser!.displayName}"),
      //     Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
      //   ],
      // ),
      // body: Center(
      //   child: Column(
      //     children: [
      //       ElevatedButton(
      //         child: Text("signout"),
      //         onPressed: () async {
      //           await FirebaseServices().signOut();
      //           Navigator.pushNamedAndRemoveUntil(
      //               context, "number_page", (route) => false);
      //         },
      //       ),
      //       Text("${FirebaseAuth.instance.currentUser!.email}"),
      //       Text("${FirebaseAuth.instance.currentUser!.displayName}"),
      //       Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
      //     ],
      //   ),
      // ));
    );
  }

  void updateImageList(BuildContext context) async {
    for (int i = 1; i <= 36; i++) {
      imageList.add(AssetImage('assets/$i.jpg'));
      //* To precache images so that when required they are loaded faster.
      await precacheImage(AssetImage('assets/$i.jpg'), context);
    }
    setState(() {
      imagePrecached = true;
    });
  }
}
