import 'package:firstapp/const/const.dart';
import 'package:firstapp/views/login_screen/loginscreen.dart';
import 'package:firstapp/views/register_screen/register_store.dart';
import 'package:firstapp/views/welcome_screen/welcome_screen.dart';
import 'package:mobx/mobx.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late RegisterStore registerStore = RegisterStore();
  // late TextEditingController _emailController;
  // late TextEditingController _passwordController;
  // late TextEditingController _nameController;
  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\.com])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  String? validatePassword(String? value) {
    const pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid password'
        : null;
  }

  @override
  void initState() {
    super.initState();
    // _nameController = TextEditingController();
    // _emailController = TextEditingController();
    // _passwordController = TextEditingController();
    reaction((_) => registerStore.isPageChange, (bool isPageChange) {
      if (isPageChange) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => WelcomeScreen()));
        registerStore.isPageChange = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color.fromARGB(255, 6, 137, 245),
                        Color.fromARGB(255, 174, 48, 233)
                      ])),
                  child: Column(
                    children: [
                      50.heightBox,
                      Icon(
                        Icons.home,
                        size: 60,
                        color: Color.fromARGB(255, 6, 137, 245),
                      ).box.size(100, 100).white.roundedFull.make(),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 428,
                  color: Colors.white,
                ),
              ],
            ),
            Positioned(
              top: 280,
              left: 40,
              child: Card(
                elevation: 0.8,
                // color: Colors.white,
                child: Container(
                  height: 330,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Name"
                          .text
                          .black
                          .size(18)
                          .color(Color.fromARGB(255, 6, 137, 245))
                          .make(),
                      Observer(builder: (_) {
                        return TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            controller: registerStore.nameController,
                            decoration: const InputDecoration(
                              isDense: true,
                              fillColor: Color.fromARGB(255, 235, 243, 243),
                              filled: true,
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                            ));
                      }),
                      30.heightBox,
                      "Email"
                          .text
                          .black
                          .size(18)
                          .color(Color.fromARGB(255, 6, 137, 245))
                          .make(),
                      Observer(builder: (_) {
                        return Form(
                          autovalidateMode: AutovalidateMode.always,
                          child: TextFormField(
                              // enabled: !loginStore.loading,
                              // onChanged: loginStore.setEmail,
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              controller: registerStore.emailController,
                              validator: validateEmail,
                              decoration: const InputDecoration(
                                // suffixIcon: Icon(Icons.person),
                                // labelText: 'E-mail',
                                isDense: true,
                                fillColor: Color.fromARGB(255, 235, 243, 243),
                                filled: true,
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                              )),
                        );
                      }),
                      20.heightBox,
                      "Password"
                          .text
                          .black
                          .size(18)
                          .color(Color.fromARGB(255, 6, 137, 245))
                          .make(),
                      Observer(builder: (_) {
                        return Form(
                          autovalidateMode: AutovalidateMode.always,
                          child: TextFormField(
                              // enabled: !loginStore.loading,
                              // onChanged: loginStore.setEmail,
                              keyboardType: TextInputType.visiblePassword,
                              autocorrect: false,
                              validator: validatePassword,
                              controller: registerStore.passwordController,
                              decoration: const InputDecoration(
                                // suffixIcon: Icon(Icons.person),
                                // labelText: 'E-mail',
                                isDense: true,
                                fillColor: Color.fromARGB(255, 235, 243, 243),
                                filled: true,
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                              )),
                        );
                      }),
                    ],
                  ).box.padding(EdgeInsets.all(20)).make(),
                ),
              ),
            ),
            Positioned(
              top: 590,
              left: 90,
              child: Observer(builder: (context) {
                return Container(
                  width: 220,
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: registerStore.isFormValid
                        ? Colors.red
                        : Color.fromARGB(255, 12, 33, 218),
                  ),
                  child: registerStore.loading
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        )
                      : Align(
                          alignment: Alignment.center,
                          child: const Text('Register',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              )),
                        ),
                ).onTap(() {
                  registerStore.signup();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => LoginPage()));
                });
              }),
            ),
            Positioned(
                top: 680,
                left: 165,
                child: "Login"
                    .text
                    .color((Color.fromARGB(255, 6, 137, 245)))
                    .size(25)
                    .make()
                    .onTap(() {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => LoginPage()));
                })),
          ],
        ),
      ),
    );
  }
}
