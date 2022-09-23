import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_page/login.dart';
import 'package:login_page/screen1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RejzAp'),
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: const Icon(Icons.exit_to_app)),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (ctx, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenOne(),
                      ));
                },
                //   onTap: () =>   Navigator.push(
                // context,
                // MaterialPageRoute(builder: (context) =>  ScreenOne()),
                title: Text('person$index'),
                subtitle: Text('message$index'),
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return Divider();
            },
            itemCount: 20),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedpref = await SharedPreferences.getInstance();
    await _sharedpref.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => LogIn()), (route) => false);
  }
}
