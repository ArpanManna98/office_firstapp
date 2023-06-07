
import 'package:firstapp/objectbox.g.dart';
import 'package:firstapp/views/login_screen/loginscreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

late Store objectbox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  objectbox = await openStore();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}

// class Homepage extends StatefulWidget {
//   const Homepage({Key? key}) : super(key: key);

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   late Stream<List<User>> streamUsers;

//   @override
//   void initState() {
//     super.initState();

//     // streamUsers = objectBox.Box.getUsers();
//     streamUsers= objectbox.box<User>().getAll();
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: const Text('ObjectBox'),
//           centerTitle: true,
//         ),
//         body: StreamBuilder<List<User>>(
//           stream: streamUsers,
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else {
//               final users = snapshot.data!;

//               return ListView.builder(
//                 itemCount: users.length,
//                 itemBuilder: (context, index) {
//                   final user = users[index];

//                   return ListTile(
//                     title: Text(user.name),
//                     subtitle: Text(user.email),
                   
//                     onTap: () {
                     
//                     },
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       );
// }