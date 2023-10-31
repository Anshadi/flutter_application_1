import 'package:flutter/material.dart';

class HomeVeiw extends StatelessWidget {
  const HomeVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          color: Colors.black,
          child: const Center(
            child: Text("hello World",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          )),
    );
  }
}
