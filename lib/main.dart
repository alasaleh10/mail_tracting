import 'package:flutter/material.dart';
import 'package:mail_tracking/core/consts.dart';
import 'package:mail_tracking/core/routs.dart';

import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();

  runApp(const MailTracking());
}

class MailTracking extends StatelessWidget {
  const MailTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimColor,
        appBarTheme: const AppBarTheme(
          elevation: 8,
          backgroundColor: kPrimColor,
        ),
      ),
      routerConfig: AppRouts.routs,
      debugShowCheckedModeBanner: false,
    );
  }
}
