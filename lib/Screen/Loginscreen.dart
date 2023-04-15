import 'package:bankloginsysteam/Screen/WecomeloginScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController _accountnumber = TextEditingController();
  TextEditingController _password = TextEditingController();

  var email = "9724824359";
  var password = "1111";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loginscreen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9raMxL6g1GYTe0Erd6buClCEDLICxTrR0bg&usqp=CAU"),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                child: TextFormField(
                  controller: _accountnumber,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff6C6C6C),
                      hintText: "Account Number",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xffFE7551),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: TextFormField(
                  controller: _password,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff6C6C6C),
                      suffixIcon: Icon(Icons.remove_red_eye_rounded),
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Color(0xff8D8D8D),
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xffFE7551),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_accountnumber.text.toString() == "9724824359" &&
                        _password.text.toString() == "1111") {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString("islogin", "yes");
                      prefs.setString("email", _accountnumber.text.toString());

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
        ),
      ),
    );
  }
}
