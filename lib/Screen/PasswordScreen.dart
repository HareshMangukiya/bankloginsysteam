import 'package:bankloginsysteam/Screen/WecomeloginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  TextEditingController _password = TextEditingController();
  var password = "1111";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PasswordScreen"),
      ),
      body: Column(
        children: [
          Container(
            child: PinCodeFields(
              length: 4,
              controller: _password,
              focusNode: FocusNode(),
              obscureText: true,


              fieldHeight:40.0,
              fieldWidth: 40.0,
              borderWidth:1.0,
              activeBorderColor: Colors.pink,
              activeBackgroundColor: Colors.pink.shade100,

              keyboardType: TextInputType.number,
              autoHideKeyboard: true,
              fieldBackgroundColor: Colors.black12,
              borderColor: Colors.black38,
              textStyle: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              onComplete: (result) {
                // Your logic with code
                              },
            ),
            // child: TextFormField(
            //   controller: _password,
            //   obscureText: true,
            //   keyboardType: TextInputType.text,
            //   decoration: InputDecoration(
            //       filled: true,
            //       fillColor: Color(0xff6C6C6C),
            //       suffixIcon: Icon(Icons.remove_red_eye_rounded),
            //       hintText: "Password",
            //       hintStyle: TextStyle(
            //         color: Color(0xff8D8D8D),
            //       ),
            //       labelStyle: TextStyle(color: Colors.white),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide(
            //           width: 2,
            //           color: Color(0xffFE7551),
            //         ),
            //         borderRadius: BorderRadius.circular(10.0),
            //       )),
            // ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: ElevatedButton(
              onPressed: () async {
                if (
                    _password.text.toString() == "1111") {
                  SharedPreferences prefs =
                  await SharedPreferences.getInstance();
                  prefs.setString("islogin", "yes");
                  prefs.setString("password", _password.text.toString());

                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WecomeloginScreen()));
                }
              },
              child: Text("Login"),
            ),
          ),
        ],
      ),
    );
  }
}
