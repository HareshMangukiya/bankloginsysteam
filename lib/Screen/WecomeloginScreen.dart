import 'package:bankloginsysteam/Screen/Loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WecomeloginScreen extends StatefulWidget {
  const  WecomeloginScreen({Key? key}) : super(key: key);

  @override
  State<WecomeloginScreen> createState() => _WecomeloginScreenState();
}

class _WecomeloginScreenState extends State<WecomeloginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WecomeloginScreen"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Welcome To Axis Bank",style: TextStyle(color: Colors.red),),
            ElevatedButton(
                onPressed: ()async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.clear();

                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Loginscreen()));
                },
                child: Text("Logout"), ),
          ],
        ),
      ),
    );
  }
}
