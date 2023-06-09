import 'package:flutter/material.dart';
import 'ble_scan_service.dart';
import 'ble_communication_service.dart';
import 'data_service.dart';
import 'messageHandler.dart';


void main() {
  runApp(   MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DataReader dataReader = DataReader();
  UserMessage sendMessage =UserMessage();
  List<String> dropdownOptions = [];
  String selectedBleMinor = 'Toate';
  String selectedCategory = 'Toate categoriile';
  bool isListening = false;
bool isStop = false;
  String message = 'Selectați o categorie pe butonul di stînga sus sau accesaț butonul ascultă pentru a găsi tot';

  void startListening() {
    // Funcția apelată când butonul "Ascultă" este apăsat
    setState(() {
      isListening = true;
      message = 'Ascultarea a început!';
    });
  }

  void stopListening() {
    // Funcția apelată când butonul "Stop" este apăsat
    setState(() {
      isListening = false;
      message = 'Ascultarea a fost oprită!';
    });
  }

  @override
  void initState () {
    super.initState();
    dataReader.loadData();
    dropdownOptions =dataReader.getDropdownOptions();
    //afișarea unui mesaj
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      sendMessage.showMessage(context, message);
    });}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(appBar: AppBar(title: Text('Echo point'),),
        //drop-down buton în stînga sus
        body: Stack(children: [Align(alignment: Alignment.topLeft, child: Padding(padding: EdgeInsets.all(15.0),
          child: DropdownButton<String>(
            items: dropdownOptions.map<DropdownMenuItem<String>>((String value) {return DropdownMenuItem<String>(value: value, child: Text(value,
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),),);},).toList(),
            onChanged: (String? newValue) { setState(() {selectedCategory = newValue!; });},
            value: selectedCategory, icon: Icon(Icons.arrow_drop_down, size: 22, color: Colors.green,),),),),
          //butonul jos lamijloc
Align(alignment: Alignment.bottomCenter, child: ElevatedButton(onPressed: (){setState(() {
isListening = !isListening; isStop = !isStop;}); if (isListening){
  sendMessage.showMessage(context, 'sa început scanarea BLE');} else {sendMessage.showMessage(context, 'Ați oprit scanare dispozitivele BLE');}},
  style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith<Color>((states){
if (isStop) {return Colors.red;} else {return Colors.green;}}),),
      child: Text(isListening ? 'Stop' : 'Ascultă', style: TextStyle(color: isListening ?Colors.white : Colors.white),),),),
        ],),

      ),);}}