import 'package:calculator_app/colors.dart';
import 'package:calculator_app/widget/button_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background1,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          margin: EdgeInsets.only(left: 8),
          child: Text('Calculator'),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //untuk user input angka
            Expanded(
              child: buildResult()
            ),

            //untuk kolom angka
            Expanded(
              flex: 2,
              child: buildButtons()
            ),
          ],
        ),
      ),
    );
  }

  Widget buildResult(){
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '0',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 36
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(3),
            child: Text(
              '0',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color.fromARGB(127, 255, 255, 255),
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget buildButtons(){
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: ColorsApp.background2,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40))
      ),
      child: Column(
        children: [
          buildButtonRow('AC', '<', '', '÷'),
          buildButtonRow('7', '8', '9', '×'),
          buildButtonRow('4', '5', '6', '−'),
          buildButtonRow('1', '2', '3', '+'),
          buildButtonRow('0', '.', '', '='),
        ],
      ),
    );
  }
  
  Widget buildButtonRow(String first, String second, String third, String fourth) {
    final row = [first, second, third, fourth];

    return Expanded(
      child: Row(
        children: row.map((element){
          return ButtonWidget(
            text: element,
            onClicked: () => print(element),
            onClickedLong: () => print(element),
          );
        }).toList(),
      ),
    );
  }
  
  
}
