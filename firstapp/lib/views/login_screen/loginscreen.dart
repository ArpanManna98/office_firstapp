import "package:firstapp/const/const.dart";
import 'package:mobx/mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Observer(builder: (_) {
                        return TextField(
                          enabled: !loginStore.loading,
                          onChanged: loginStore.setEmail,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          controller: _emailController,
                          decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.person),
                              labelText: 'E-mail',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        );
                      }),
                      SizedBox(
                        height: 30,
                      ),

                      Observer(builder: (_) {
                        return TextField(
                          enabled: !loginStore.loading,
                          onChanged: loginStore.setPassword,
                          // obscureText: loginStore.showPassword,
                          keyboardType: TextInputType.visiblePassword,
                          autocorrect: false,
                          controller: _passwordController,
                          decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.password),
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        );
                      }),
          ],
        ),
      ),
    );
  }
}
