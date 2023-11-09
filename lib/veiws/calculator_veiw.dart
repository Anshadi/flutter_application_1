// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaclculatorVeiw extends StatefulWidget {
  const CaclculatorVeiw({super.key});


  @override
  State<CaclculatorVeiw> createState() => _CaclculatorVeiwState();
}

class _CaclculatorVeiwState extends State<CaclculatorVeiw> {
  int x=0;//for first number
  int y=0;//for second number
  num z=0;//for result num can take int and float too

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

    late final AppLifecycleListener _listener;

 @override
  void initState() {
    super.initState();
    displayOneController.text =x.toString();
    displayTwoController.text =y.toString();

    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onDetach: _onDetach,
      onInactive: _onInactive,
      onPause:_onPause ,
      onResume: _onResume,
      onRestart: _onRestart,
      onStateChange: _onStateChange,
      // onExitRequested: _onExitRequested,
    );
  }

  void _onShow () => print("On show called"); //on calling the function it will  print this
  void _onHide () => print("On hide called");
  void _onDetach () => print("On Detach called");
  void _onPause () => print("On Pause called");
  void _onRestart () => print("On Restart called");
  void _onResume () => print("On Resume called");
  void _onInactive () => print("On Inactive called");

  void _onStateChange (AppLifecycleState state) => print("On StateChange called with state: $state");
  

  @override
  void dispose(){
    displayOneController.dispose();
    displayTwoController.dispose();
    _listener.dispose();
    super.dispose();

  }


  
  // Check if input contains only numbers or a single decimal point

  //THIS IS TO RESTRICT LAPTOP KEYBOARD TO ENTER STRING AS WE HAVE ALREADY SET THE INPUT TYPE TO NUMBERS ONLY.
  //   if (!_isValidNumber(inputOne) || !_isValidNumber(inputTwo)) {
  //     print("Invalid input");
  //     return;
  //   }

  //   // Perform calculations
  //   setState(() {
  //     z = num.tryParse(inputOne)! + num.tryParse(inputTwo)!;
  //   });
  // }

  // bool _isValidNumber(String input) {
  //   final RegExp numberRegex = RegExp(r'^\d+(\.\d+)?$');
  //   return numberRegex.hasMatch(input);
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          //calculator display
          //when we put textfield in it doesn,t remains stateless it does something
          CalulatorDisplay(
          key: const Key("displayone"),
          hint: "Enter first number",
          controller: displayOneController),
          
          const SizedBox(
            height:30,
            ),

          CalulatorDisplay(
          key: const Key("displaytwo"),
          hint:"Enter second number",
          controller: displayTwoController), 
          //expand
          const SizedBox(
            height:30,
            ),

            Text(
              key :const Key("Result"),
              z.toString(),
            style: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,  
            ),
            ),


          const Spacer(),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(onPressed: () {
                setState(() {
                   z=num.tryParse(displayOneController.text)!  + num.tryParse(displayTwoController.text)!;
                });
               
              },
              child: const Icon(CupertinoIcons.add),
              ),

              FloatingActionButton(onPressed: () {
              setState(() {
                   z=num.tryParse(displayOneController.text)!  - num.tryParse(displayTwoController.text)!;
                });
              },
              child: const Icon(CupertinoIcons.minus),
              ),
              
              FloatingActionButton(onPressed: () {
                setState(() {
                   z=num.tryParse(displayOneController.text)!  * num.tryParse(displayTwoController.text)!;
                });
              },
              child: const Icon(CupertinoIcons.multiply
              ),
              ),
              
              FloatingActionButton(onPressed: () {
               setState(() {
                   z=num.tryParse(displayOneController.text)!  / num.tryParse(displayTwoController.text)!;
                });
              },
              child: const Icon(CupertinoIcons.divide),
              )
            ],
          ),
          const SizedBox(height: 10,),
          FloatingActionButton.extended(onPressed: (){

            setState(() {
              x=0;
              y=0;
              z=0;
              displayOneController.clear();
              displayTwoController.clear();
            });

          }, 
          label: const Text("Clear"),)
          //calculator buttons
        ],
      ),
    );
  }
}

class CalulatorDisplay extends StatelessWidget {
  const CalulatorDisplay({
    super.key,
    this.hint ="Enter a number", 
    required this.controller
  });

  final String? hint;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      autofocus: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: Colors.black, width: 3.0),
        borderRadius : BorderRadius.circular(10),
        ),
        
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black , width: 3.0),
        
        borderRadius : BorderRadius.circular(10),
         ),
        hintText: hint,
      hintStyle:const TextStyle(color: Colors.white)
      ),    
    );
  }
}
