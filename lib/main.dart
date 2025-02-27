import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Persentase Kecocokan Jodoh',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontSize: 18),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
        ),
        fontFamily: 'Poppins',
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  double _matchPercentage = 0.0;

  void _calculateMatch() {
    String input1 = _controller1.text.trim();
    String input2 = _controller2.text.trim();

    if (input1.isEmpty || input2.isEmpty) {
      return;
    }

    Random random = Random();
    double match = random.nextDouble() * 100;

    setState(() {
      _matchPercentage = match;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade600,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/image/logomatchlove.png',
              height: 45,
            ),
            SizedBox(width: 10),
            Text(
              'MatchLove!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink.shade200, Colors.pink.shade800],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Cek Persentase Kecocokan Jodoh Anda!',
                  style: TextStyle(
                    fontSize: width * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.05),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  child: TextField(
                    controller: _controller1,
                    decoration: InputDecoration(
                      labelText: 'Masukkan Nama Pria',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      prefixIcon: Image.asset(
                        'assets/image/man.png',
                        height: 25,
                        width: 25,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  child: TextField(
                    controller: _controller2,
                    decoration: InputDecoration(
                      labelText: 'Masukkan Nama Wanita',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      prefixIcon: Image.asset(
                        'assets/image/woman.png',
                        height: 25,
                        width: 25,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: height * 0.05),
                ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    _calculateMatch();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade500,
                    padding: EdgeInsets.symmetric(vertical: height * 0.025, horizontal: width * 0.1),
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Hitung Kecocokan!',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                SizedBox(height: height * 0.05),
                _matchPercentage > 0
                    ? Column(
                  children: [
                    Text(
                      'Persentase Kecocokan:',
                      style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      '${_matchPercentage.toStringAsFixed(2)}%',
                      style: TextStyle(
                        fontSize: width * 0.1,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    IconButton(
                      icon: Icon(Icons.restart_alt, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          _controller1.clear();
                          _controller2.clear();
                          _matchPercentage = 0.0;
                        });
                      },
                    ),
                  ],
                )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
