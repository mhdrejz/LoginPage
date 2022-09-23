import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_page/home.dart';
import 'package:login_page/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});
  final _usernamecontroller = TextEditingController();
  final _passswordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _username = 'mhdrejz';
  final _password = '373737';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: SafeArea(
            child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _usernamecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'USER NAME',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "empty username";
                  } else if (value != _username) {
                    return 'invalid username';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: _passswordcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'PASSWORD',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Empty password';
                  } else if (value != _password) {
                    return 'invalid Password';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    checkLogin(context);
                  } else {
                    print('data empty');
                  }
                },
                icon: Icon(Icons.check),
                label: Text('Login'),
              ),
            ],
          ),
        )),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final username = _usernamecontroller.text;
    final password = _passswordcontroller.text;

    if (username == _username && password == _password) {
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY, true);
      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
      //go to home page
    } else {}
  }
}
