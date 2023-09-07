import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, required this.title, required this.onPressed});
final String title;
final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
                onPressed: onPressed(),
                child:  Text(
                  title,
                  style:const TextStyle(color: Colors.red,fontSize: 20, fontWeight: FontWeight.bold),
                ));
  }
}