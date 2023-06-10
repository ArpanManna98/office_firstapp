import 'package:firstapp/locator.dart';
import 'package:firstapp/objectbox.g.dart';
import 'package:firstapp/views/login_screen/loginscreen.dart';
import 'package:firstapp/views/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

late Store objectbox;
late SharedPreferences globalSharedPrefs;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
   globalSharedPrefs = await SharedPreferences.getInstance();
  var email = globalSharedPrefs.getString("email");
  debugPrint("user ${email}");
  await setupLocator();
  

  // runApp( MyApp());
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: email==null?LoginPage():WelcomeScreen(),));
    
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     var email;
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: email == null ? LoginPage() : WelcomeScreen(),
//     );
//   }
// }
