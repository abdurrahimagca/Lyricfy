import 'package:flutter/material.dart';

class GeneralCheckbox  extends StatefulWidget {
  const GeneralCheckbox({super.key});

  @override
  GeneralCheckBoxState createState() => GeneralCheckBoxState(); 
}

class GeneralCheckBoxState extends State<GeneralCheckbox>{
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(value: false  , onChanged: (bool? nvalue){
      setState(() {
        value = nvalue;
      });
    });
 
   }

}