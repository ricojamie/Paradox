import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:paradox/login.dart';
import 'package:paradox/signup.dart';
import 'package:paradox/placeholder.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://uyeyihcnxerjuxhxzriw.supabase.co",
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV5ZXlpaGNueGVyanV4aHh6cml3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2Nzk3ODEzNzgsImV4cCI6MTk5NTM1NzM3OH0.OiYkCngBwbq313Gzvo30-oPIiGZyi9uLY3mDj_0Ptss',
  );
  runApp(Paradox());
}

final supabase = Supabase.instance.client;

class Paradox extends StatelessWidget {
  const Paradox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Paradox',
        initialRoute: '/',
        routes: {
          '/login': (context) => LoginScreen(),
          '/next': (context) => name(),
          '/signup': (context) => SignUpScreen(),
        },
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Paradox"),
          ),
          body: Builder(builder: (context) {
            final user = supabase.auth.currentUser;

            if (user == null) {
              return LoginScreen();
            } else {
              return name();
            }
          }),
        ),
      );
}
