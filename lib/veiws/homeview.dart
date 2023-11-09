import 'package:flutter/material.dart';
import 'package:flutter_application_1/veiws/calculator_veiw.dart';

class HomeVeiw extends StatelessWidget {
  const HomeVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        body: SafeArea(
          child: Container(
            color: Colors.brown,
            child: const CaclculatorVeiw(),
          ),
        ));
  }
}


/*const Center(
            child: Text("Hello World",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          )),*/