import 'package:flutter/material.dart';

void main() => runApp(const Paradox());

class Paradox extends StatelessWidget {
  const Paradox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Paradox',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Paradox"),
          ),
          body: Center(
            child: Text("Hello"),
          ),
        ),
      );
}
