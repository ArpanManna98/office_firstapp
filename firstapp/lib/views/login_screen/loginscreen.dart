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
//************reset password modal bottom sheet********** */
  late TextEditingController bottompassController;
  late TextEditingController repasswordController;

  //************Email validation function********** */

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
//************password validation fun********** */

  String? validatePassword(String? value) {
    const pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid password'
        : null;
  }

  String _password = '';
  String _confirmPassword = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    bottompassController = TextEditingController();
    repasswordController = TextEditingController();
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
                child: Container(
                  height: 300,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              controller: loginStore.emailController,
                              validator: validateEmail,
                              decoration: const InputDecoration(
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
                              keyboardType: TextInputType.visiblePassword,
                              autocorrect: false,
                              validator: validatePassword,
                              controller: loginStore.passwordController,
                              decoration: const InputDecoration(
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
              top: 560,
              left: 90,
              child: Observer(builder: (context) {
                return Container(
                  width: 220,
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: loginStore.isFormValid
                        ? Colors.red
                        : Color.fromARGB(255, 12, 33, 218),
                  ),
                  child: loginStore.loading
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        )
                      : Align(
                          alignment: Alignment.center,
                          child: const Text('Login',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              )),
                        ),
                ).onTap(() {
                  loginStore.login();
                });
              }),
            ),
            Positioned(
                top: 650,
                left: 155,
                child: "Register"
                    .text
                    .color((Color.fromARGB(255, 6, 137, 245)))
                    .size(25)
                    .make()
                    .onTap(() {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => RegisterScreen()));
                })),
            Positioned(
              top: 750,
              left: 110,
              child: "Forgot Password ?"
                  .text
                  .color((Color.fromARGB(255, 187, 188, 190)))
                  .size(25)
                  .make()
                  .onTap(() {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Stack(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 30, left: 20, right: 20),
                              height: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      "Forgot Password"
                                          .text
                                          .bold
                                          .black
                                          .size(25)
                                          .make(),
                                      Spacer(),
                                      Icon(
                                        Icons.cancel,
                                        size: 20,
                                      ).onTap(() {
                                        Navigator.pop(context);
                                      }),
                                    ],
                                  ),
                                  40.heightBox,
                                  "Email"
                                      .text
                                      .black
                                      .size(18)
                                      .color(Color.fromARGB(255, 6, 137, 245))
                                      .make(),
                                  10.heightBox,
                                  Observer(builder: (_) {
                                    return Form(
                                      autovalidateMode: AutovalidateMode.always,
                                      child: TextFormField(
                                          // enabled: !loginStore.loading,
                                          // onChanged: loginStore.setEmail,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          autocorrect: false,
                                          controller:
                                              loginStore.emailController,
                                          validator: validateEmail,
                                          decoration: const InputDecoration(
                                            // suffixIcon: Icon(Icons.person),
                                            // labelText: 'E-mail',
                                            isDense: true,
                                            fillColor: Color.fromARGB(
                                                255, 235, 243, 243),
                                            filled: true,
                                            border: InputBorder.none,
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black)),
                                          )),
                                    );
                                  }),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 230,
                              left: 10,
                              child: Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width - 20,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: loginStore.isFormValid
                                      ? Colors.red
                                      : Color.fromARGB(255, 12, 33, 218),
                                ),
                                child: loginStore.loading
                                    ? const CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.white),
                                      )
                                    : Align(
                                        alignment: Alignment.center,
                                        child: const Text('Proceed',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                            )),
                                      ),
                              ).onTap(() {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: Stack(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 30, left: 20, right: 20),
                                              height: 400,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      "Reset Password"
                                                          .text
                                                          .bold
                                                          .black
                                                          .size(25)
                                                          .make(),
                                                      Spacer(),
                                                      Icon(
                                                        Icons.cancel,
                                                        size: 20,
                                                      ).onTap(() {
                                                        Navigator.pop(context);
                                                      }),
                                                    ],
                                                  ),
                                                  40.heightBox,
                                                  "Password"
                                                      .text
                                                      .black
                                                      .size(18)
                                                      .color(Color.fromARGB(
                                                          255, 6, 137, 245))
                                                      .make(),
                                                  10.heightBox,
                                                  Form(
                                                    key: _formKey,
                                                    autovalidateMode:
                                                        AutovalidateMode.always,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        TextFormField(
                                                            // enabled: !loginStore.loading,
                                                            onChanged: (value) {
                                                              _password = value;
                                                            },
                                                            keyboardType:
                                                                TextInputType
                                                                    .visiblePassword,
                                                            autocorrect: false,
                                                            controller:
                                                                bottompassController,
                                                            validator:
                                                                validatePassword,
                                                            decoration:
                                                                const InputDecoration(
                                                              isDense: true,
                                                              fillColor: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      235,
                                                                      243,
                                                                      243),
                                                              filled: true,
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.black)),
                                                            )),
                                                        "Re-Enter Password"
                                                            .text
                                                            .black
                                                            .size(18)
                                                            .color(
                                                                Color.fromARGB(
                                                                    255,
                                                                    6,
                                                                    137,
                                                                    245))
                                                            .make()
                                                            .box
                                                            .margin(
                                                                EdgeInsets.only(
                                                                    right: 80))
                                                            .make(),
                                                        10.heightBox,
                                                        TextFormField(
                                                            onChanged: (value) {
                                                              _confirmPassword =
                                                                  value;
                                                            },
                                                            keyboardType:
                                                                TextInputType
                                                                    .visiblePassword,
                                                            autocorrect: false,
                                                            controller:
                                                                repasswordController,
                                                            validator: (value) {
                                                              if (value !=
                                                                      null &&
                                                                  value
                                                                      .isEmpty) {
                                                                return 'Conform password is required please enter';
                                                              }
                                                              if (value !=
                                                                  _password) {
                                                                return 'Confirm password not matching';
                                                              }
                                                              return null;
                                                            },
                                                            decoration:
                                                                const InputDecoration(
                                                              isDense: true,
                                                              fillColor: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      235,
                                                                      243,
                                                                      243),
                                                              filled: true,
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.black)),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  // Positioned(
                                                  //     top: 400,
                                                  //     left: 10,
                                                  //     child: Container(
                                                  //       height: 60,
                                                  //       width: MediaQuery.of(
                                                  //                   context)
                                                  //               .size
                                                  //               .width -
                                                  //           20,
                                                  //       padding:
                                                  //           const EdgeInsets
                                                  //               .all(10),
                                                  //       decoration:
                                                  //           BoxDecoration(
                                                  //         borderRadius:
                                                  //             BorderRadius
                                                  //                 .circular(20),
                                                  //         color: loginStore
                                                  //                 .isFormValid
                                                  //             ? Colors.red
                                                  //             : Color.fromARGB(
                                                  //                 255,
                                                  //                 12,
                                                  //                 33,
                                                  //                 218),
                                                  //       ),
                                                  //       child: loginStore
                                                  //               .loading
                                                  //           ? const CircularProgressIndicator(
                                                  //               valueColor:
                                                  //                   AlwaysStoppedAnimation(
                                                  //                       Colors
                                                  //                           .white),
                                                  //             )
                                                  //           : Align(
                                                  //               alignment:
                                                  //                   Alignment
                                                  //                       .center,
                                                  //               child: const Text(
                                                  //                   'Proceed',
                                                  //                   textAlign:
                                                  //                       TextAlign
                                                  //                           .center,
                                                  //                   style:
                                                  //                       TextStyle(
                                                  //                     color: Colors
                                                  //                         .white,
                                                  //                     fontSize:
                                                  //                         25,
                                                  //                   )),
                                                  //             ),
                                                  //     )),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                                top: 330,
                                                left: 10,
                                                child: Container(
                                                  height: 60,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      20,
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: loginStore
                                                            .isFormValid
                                                        ? Colors.red
                                                        : Color.fromARGB(
                                                            255, 12, 33, 218),
                                                  ),
                                                  child: loginStore.loading
                                                      ? const CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation(
                                                                  Colors.white),
                                                        )
                                                      : Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: const Text(
                                                              'Proceed',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 25,
                                                              )),
                                                        ),
                                                )),
                                          ],
                                        ),
                                      );
                                    });
                              }),
                            ),
                          ],
                        ),
                      );
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
