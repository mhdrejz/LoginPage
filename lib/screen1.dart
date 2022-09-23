import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('person1'),
        leading: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundColor: Colors.indigo,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Text(
            'rajnaz',
            style: TextStyle(fontSize: 40),
          ),
          Image(image: AssetImage('assets/images/mypic.jpg')),
        ],
      ),
    );
  }
}
