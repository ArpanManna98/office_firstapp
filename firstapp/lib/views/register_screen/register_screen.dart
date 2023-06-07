import 'package:firstapp/const/const.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            Observer(builder: (_) {
              return TextField(
                
                // enabled: !loginStore.loading,
              
                // obscureText: loginStore.showPassword,
                keyboardType: TextInputType.name,
                autocorrect: false,
                controller: registerStore.nameController,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.person),
                    labelText: 'Name',
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
                // onChanged: loginStore.setEmail,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                controller: registerStore.emailController,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.email),
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
                controller: registerStore.passwordController,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.password),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              );
            }),
            Spacer(),
            Observer(builder: (context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: registerStore.isFormValid ? Colors.blue : Colors.red,
                ),
                child: registerStore.loading
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      )
                    : const Text('Register',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
              ).onTap(() {
                registerStore.signup();
              });
            }),
          ],
        ),
      ),
    );
  }
}
