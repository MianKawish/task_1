import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_1/provider/loginProvider.dart';
import 'package:task_1/provider/signupProvider.dart';
import 'package:task_1/screens/homeScreen.dart';
import 'package:task_1/screens/loginScreen.dart';

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
    final signupProvider = Provider.of<SignupProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.05, horizontal: width * 0.05),
        child: Consumer(
          builder: (BuildContext context, value, Widget? child) {
            return ListView(
              children: [
                const Text(
                  "SignUp",
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
                              return "Please enter at least 3 characters";
                            } else {
                              return null;
                            }
                          },
                          decoration:
                              textFieldDecoration("Enter your First Name"),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        TextFormField(
                          controller: signupProvider.lastNameController,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 3) {
                              return "Please enter at least 3 characters";
                            } else {
                              return null;
                            }
                          },
                          decoration:
                              textFieldDecoration("Enter your Last Name"),
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
                              return "Please enter a valid emial";
                            }
                          },
                          decoration: textFieldDecoration("Enter your email"),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: signupProvider.passwordController,
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
                Consumer<SignupProvider>(
                  builder: (context, value, child) {
                    return ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue)),
                        onPressed: signupProvider.isLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  signupProvider.signupUser(
                                      signupProvider.firstNameController.text,
                                      signupProvider.lastNameController.text,
                                      signupProvider.emailController.text,
                                      signupProvider.passwordController.text,
                                      context);
                                }
                              },
                        child: signupProvider.isLoading
                            ? const Center(
                                child: SizedBox(
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            : const Text(
                                "Signup",
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
                    const Text("Already have an account?"),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                        },
                        child: const Text(
                          "Login",
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
