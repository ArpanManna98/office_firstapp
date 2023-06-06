import 'package:firstapp/const/const.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: "Welcome To New PAge".text.bold.black.size(30).center.make(),
      ),),
    );
  }
}

// 
https://flutterawesome.com/a-state-machine-for-mobx-management-that-can-be-used-in-almost-any-application-state/
https://github.com/ismaelsousa/mobx/tree/master
https://objectbox.io/crud-flutter-database/ 
https://github.com/objectbox/objectbox-dart/tree/main/objectbox/example/flutter/objectbox_demo
//