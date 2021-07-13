import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key key, String nama, String password}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Selamat anda telah berhasil Login'),
      ),
    );
  }
}
