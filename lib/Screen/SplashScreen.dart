import 'package:bankloginsysteam/Screen/Loginscreen.dart';
import 'package:bankloginsysteam/Screen/PasswordScreen.dart';
import 'package:bankloginsysteam/Screen/WecomeloginScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checklogin() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("islogin"))
    {
      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PasswordScreen()));
    }
    else
    {
      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Loginscreen()));
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      checklogin();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SplashScreen"),
      ),
      body: Center(
        child: Container(
        alignment: Alignment.center,
          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDYw-Kls3r7jELQI9ZK0eFncgPqv-SxsW0Ig&usqp=CAU")),
      ),
    );

  }
}
