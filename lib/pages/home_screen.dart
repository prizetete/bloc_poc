import 'package:bloc_poc/router_name.dart';
import 'package:bloc_poc/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.ant);
              },
              child: const CustomText("Ant", color: Colors.teal),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.bee);
              },
              child: const CustomText("Bee", color: Colors.teal),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.pai);
              },
              child: const CustomText("Pai", color: Colors.red),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.advanced);
              },
              child: const CustomText("Advanced", color: Colors.amber),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.user);
              },
              child: const CustomText("User", color: Colors.amber),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.userX);
              },
              child: const CustomText("UserX", color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}
