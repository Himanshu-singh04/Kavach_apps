import 'package:citisers/services/functions.dart';
import 'package:citisers/utils/constants.dart';
import 'package:citisers/utils/profile_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import '../utils/color_utils.dart';

class complete_profile extends StatefulWidget {
  const complete_profile({super.key});

  @override
  State<complete_profile> createState() => _complete_profileState();
}

class _complete_profileState extends State<complete_profile> {
  late final TextEditingController _name;
  late final TextEditingController _vehicleNumber;
  late final TextEditingController _mobileNumber;
  late final TextEditingController _licenseNo;

  Client? httpClient;
  Web3Client? ethClient;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    httpClient = Client();
    ethClient = Web3Client(infura_url, httpClient!);
    _name = TextEditingController();
    _vehicleNumber = TextEditingController();
    _mobileNumber = TextEditingController();
    _licenseNo = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _vehicleNumber.dispose();
    _mobileNumber.dispose();
    _licenseNo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: profile_appbar(),
          preferredSize: Size.fromHeight(kToolbarHeight)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _name,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _vehicleNumber,
              decoration: InputDecoration(
                labelText: 'Vehicle Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _mobileNumber,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _licenseNo,
              decoration: InputDecoration(
                labelText: 'License Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // TextField(
            //   onChanged: _onDLChanged,
            //   decoration: InputDecoration(
            //     labelText: 'Driving License Number',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, 'home_page');
            //     print(_name);
            //     print(_email);
            //     print(_aadhar);
            //     print(_number);
            //     print(_offname);
            //     print(_license_no);
            //     print(_DL);
            //   },
            //   child: Text('Submit'),
            // ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: hexStringToColor('#F2FCFF'),
                      onPrimary: Colors.black,
                      minimumSize: Size(double.infinity, 40)),
                  icon: FaIcon(FontAwesomeIcons.upload),
                  onPressed: () async {
                    final name = _name.text;
                    final vehicleNumber = _vehicleNumber.text;
                    final mobileNumber = int.parse(_mobileNumber.text);
                    final licenseNo = _licenseNo.text;
                    await addToBlockchain(name, vehicleNumber, licenseNo,
                        mobileNumber, ethClient!);
                    // write code to push to display profile page
                    Navigator.pushNamed(context, "display_profile");
                  },
                  label: Text(
                    "Upload Details",
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
