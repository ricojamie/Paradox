import 'package:flutter/material.dart';
import 'package:paradox/login.dart';

void main() => runApp(const Paradox());

class Paradox extends StatelessWidget {
  const Paradox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Paradox',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Paradox"),
          ),
          body: LoginScreen(),
          // body: const Center(
          //   child: Text("Hello"),
        ),
      );
}
