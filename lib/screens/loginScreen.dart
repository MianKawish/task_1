import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:task_1/provider/loginProvider.dart';
import 'package:task_1/screens/homeScreen.dart';
import 'package:task_1/screens/signupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.05, horizontal: width * 0.05),
        child: Consumer(
          builder: (BuildContext context, value, Widget? child) {
            return ListView(
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: loginProvider.emailController,
                          validator: (value) {
                            if (value!.contains("@") &&
                                value.endsWith(".com")) {
                              return null;
                            } else {
                              return "Please enter a valid emial";
                            }
                          },
                          decoration: textFieldDecoration("Enter our email"),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: loginProvider.passwordController,
                          validator: (value) {
                            if (value!.length < 8 || value!.isEmpty) {
                              return "Password at least should be 8 characters";
                            } else {
                              return null;
                            }
                          },
                          decoration:
                              textFieldDecoration("Enter your password"),
                        )
                      ],
                    )),
                SizedBox(
                  height: height * 0.1,
                ),
                Consumer(
                  builder: (context, value, child) {
                    return ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue)),
                        onPressed: loginProvider.isLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  loginProvider.loginUser(
                                      loginProvider.emailController.text,
                                      loginProvider.passwordController.text,
                                      context);
                                }
                              },
                        child: loginProvider.isLoading
                            ? const Center(
                                child: SizedBox(
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ));
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ));
                        },
                        child: const Text(
                          "Signup",
                          style: TextStyle(
                              fontStyle: FontStyle.italic, color: Colors.blue),
                        ))
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
