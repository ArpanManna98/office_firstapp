import "package:firstapp/const/const.dart";
import 'package:firstapp/views/login_screen/login_store.dart';
import 'package:firstapp/views/register_screen/register_screen.dart';
import 'package:firstapp/views/register_screen/register_store.dart';
import 'package:firstapp/views/welcome_screen/welcome_screen.dart';
import 'package:mobx/mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginStore loginStore = LoginStore();
  late RegisterStore registerStore = RegisterStore();
  // late TextEditingController _emailController;
  // late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    // _emailController = TextEditingController();
    // _passwordController = TextEditingController();
    reaction((_) => loginStore.isPageChange, (bool isPageChange) {
      if (isPageChange) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => WelcomeScreen()));
        loginStore.isPageChange = false;
      }
    });

    reaction((_) => registerStore.isPageChange, (bool isPageChange) {
      if (isPageChange) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => RegisterScreen()));
        registerStore.isPageChange = false;
      }
    });
  }
  //   @override
  // void dispose() {
  //   reactionDisposer();
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }
  //  @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();

  //   reactionDisposer = reaction((_) => loginStore.isPageChange, (bool isPageChange) {

  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (_) => WelcomeScreen()));

  // });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Observer(builder: (_) {
              return TextField(
                // enabled: !loginStore.loading,
                // onChanged: loginStore.setEmail,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                controller: loginStore.emailController,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.person),
                    labelText: 'E-mail',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              );
            }),
            SizedBox(
              height: 30,
            ),
            Observer(builder: (_) {
              return TextField(
                // enabled: !loginStore.loading,
                // onChanged: loginStore.setPassword,
                // obscureText: loginStore.showPassword,
                keyboardType: TextInputType.visiblePassword,
                autocorrect: false,
                controller: loginStore.passwordController,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.password),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              );
            }),
            // const Spacer(),
            SizedBox(
              height: 50,
            ),
            Observer(builder: (context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: loginStore.isFormValid ? Colors.blue : Colors.red,
                ),
                child: loginStore.loading
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      )
                    : const Text('Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
              ).onTap(() {
                loginStore.login();
              });
            }),
            50.heightBox,
            "Register".text.bold.black.size(30).center.make().onTap(() {
              registerStore.signup();
            })
          ],
        ),
      ),
    );
  }
}
