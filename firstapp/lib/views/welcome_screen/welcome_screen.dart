import 'package:firstapp/const/const.dart';
import 'package:firstapp/views/login_screen/loginscreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
        child: Column(
          children: [
            "Welcome To New PAge".text.bold.black.size(30).center.make(),
            ElevatedButton(onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
            pref.remove("email");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              }, 
            child: "LogOut".text.size(30).make(),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

