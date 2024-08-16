import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:task_1/view_model/controller/signup/signupProvider.dart';
import 'package:task_1/res/appStrings/appStrings.dart';
import 'package:task_1/view/homeView/homeScreen.dart';
import 'package:task_1/view/loginView/loginScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final signupProvider = Provider.of<SignupProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.05, horizontal: width * 0.05),
        child: Consumer(
          builder: (BuildContext context, value, Widget? child) {
            return ListView(
              children: [
                const Text(
                  Appstrings.signupText,
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
                          controller: signupProvider.firstNameController,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 3) {
                              return Appstrings.nameErrorText;
                            } else {
                              return null;
                            }
                          },
                          decoration:
                              textFieldDecoration(Appstrings.firstNameHintText),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        TextFormField(
                          controller: signupProvider.lastNameController,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 3) {
                              return Appstrings.nameErrorText;
                            } else {
                              return null;
                            }
                          },
                          decoration:
                              textFieldDecoration(Appstrings.lastNameHintText),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        TextFormField(
                          controller: signupProvider.emailController,
                          validator: (value) {
                            if (value!.contains("@") &&
                                value.endsWith(".com")) {
                              return null;
                            } else {
                              return Appstrings.emailErrorText;
                            }
                          },
                          decoration:
                              textFieldDecoration(Appstrings.hintEmailText),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: signupProvider.passwordController,
                          validator: (value) {
                            if (value!.length < 8 || value.isEmpty) {
                              return Appstrings.passwordErrorText;
                            } else {
                              return null;
                            }
                          },
                          decoration:
                              textFieldDecoration(Appstrings.hintPasswordText),
                        )
                      ],
                    )),
                SizedBox(
                  height: height * 0.1,
                ),
                signupProvider.isLoading
                    ? ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue)),
                        onPressed: null,
                        child: Center(
                          child: Container(
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ))
                    : ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            signupProvider.signupUser(
                              signupProvider.firstNameController.text,
                              signupProvider.lastNameController.text,
                              signupProvider.emailController.text,
                              signupProvider.passwordController.text,
                              context,
                            );
                          }
                        },
                        child: const Text(
                          Appstrings.signupText,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(Appstrings.accountLoginHintText),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                        },
                        child: const Text(
                          Appstrings.loginText,
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
