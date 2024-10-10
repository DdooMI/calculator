import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({required this.number,required this.function,required this.color,super.key});
  String number;
  Color color;
  VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
            onPressed: function,
            style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                )
            ),
            child: Text(number,style:const TextStyle(color: Colors.white,fontSize: 30),)),
      ),
    );
  }
}
