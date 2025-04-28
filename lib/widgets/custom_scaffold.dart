import 'dart:developer';

import 'package:bloc_poc/router_name.dart';
import 'package:bloc_poc/widgets/custom_floating_action_button.dart';
import 'package:bloc_poc/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final List<Widget> children;

  final String title;

  final List<CustomFloatingActionButton>? customFloatingActionButton;
  const CustomScaffold({
    super.key,
    required this.children,
    required this.title,
    this.customFloatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(title),
        actions: [
          IconButton(
            onPressed: () {
              log("go Cart");
              Navigator.pushNamed(context, RouteName.shoppingCart);
              // showDialog(
              //   context: context,
              //   builder: (context) {
              //     return const CartPage();
              //   },
              // );
            },
            icon: const Icon(Icons.shopping_cart),
            color: Colors.red,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: children,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <CustomFloatingActionButton>[
          ...customFloatingActionButton ?? [],
        ],
      ),
    );
  }
}
