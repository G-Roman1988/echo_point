import 'package:flutter/material.dart';

class UserMessage {
  //amplasarea textului la mijloc de ecran
   void showMessage( BuildContext context, String newMessage, [Color? textColor, Color? backgroundColor]){
     final defaultTextColor = Colors.black;
final defaultBackgroundColor =Colors.white;
final actualTextColor =textColor??defaultTextColor;
final actualBackgroudColor =backgroundColor??defaultBackgroundColor;
showDialog(context: context, builder: (BuildContext context) {
return AlertDialog(content: Container(
color: actualBackgroudColor, child: Center(child: Text(newMessage, style: TextStyle(fontSize: 26, color: actualTextColor, fontWeight: FontWeight.bold),),),),);
},);
}}


