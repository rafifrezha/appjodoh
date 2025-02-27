import 'package:flutter/material.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
home: MatchPercentageScreen(),
);
}
}

class MatchPercentageScreen extends StatefulWidget {
@override
_MatchPercentageScreenState createState() =>
_MatchPercentageScreenState();
}

class _MatchPercentageScreenState extends State<MatchPercentageScreen> {
final TextEditingController _nameController1 = TextEditingController();
final TextEditingController _nameController2 = TextEditingController();
String _result = "";

double _calculateMatchPercentage(String name1, String name2) {
int matchCount = 0;
int minLength = name1.length < name2.length ? name1.length : name2.length;

    // Loop through each character and count matches
    for (int i = 0; i < minLength; i++) {
      if (name1[i].toLowerCase() == name2[i].toLowerCase()) {
        matchCount++;
      }
    }

    return (matchCount / minLength) * 100;
}

void _onCalculateButtonPressed() {
String name1 = _nameController1.text.trim();
String name2 = _nameController2.text.trim();

    if (name1.isEmpty || name2.isEmpty) {
      setState(() {
        _result = "Please enter both names.";
      });
      return;
    }

    double matchPercentage = _calculateMatchPercentage(name1, name2);
    setState(() {
      _result = "Cocokan: ${matchPercentage.toStringAsFixed(2)}%";
    });
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Aplikasi Kecocokan Nama'),
centerTitle: true,
),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
TextField(
controller: _nameController1,
decoration: InputDecoration(labelText: 'Nama 1'),
),
TextField(
controller: _nameController2,
decoration: InputDecoration(labelText: 'Nama 2'),
),
SizedBox(height: 20),
ElevatedButton(
onPressed: _onCalculateButtonPressed,
child: Text('Hitung Kecocokan'),
),
SizedBox(height: 20),
if (_result.isNotEmpty) Text(_result, style: TextStyle(fontSize: 20)),
],
),
),
);
}
}
