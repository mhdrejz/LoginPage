import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_page/home.dart';
import 'package:login_page/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

const SAVE_KEY = 'userLoggedIn';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/mypic.jpg',
          height: 180,
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (ctx) => LogIn(),
    ));
  }

  Future<void> checkUserLogin() async {
    final _sharedprefs = await SharedPreferences.getInstance();
    // _sharedprefs.setBool(SAVE_KEY, true);
    final _userLoggedIn = _sharedprefs.getBool(SAVE_KEY);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      gotoLogin();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => HomeScreen()));
    }
  }
}
