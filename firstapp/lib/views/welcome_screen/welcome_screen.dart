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