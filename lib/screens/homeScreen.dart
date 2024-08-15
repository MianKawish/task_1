import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:task_1/provider/homeProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  updateValues(String firstName, String lastName, String email) {
    final provide = Provider.of<HomeProvider>(context, listen: false);
    provide.setLoading(false);
    provide.updateUserData(firstName, lastName);
  }

  makeItEditable() {
    final provide = Provider.of<HomeProvider>(context, listen: false);

    provide.setLoading(true);
  }

  @override
  void initState() {
    final provide = Provider.of<HomeProvider>(context, listen: false);
    provide.textFieldValueIntializer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(
              color: Colors.blue, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: _showMyDialog,
              icon: const Icon(
                Icons.logout_rounded,
                color: Colors.red,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.05, horizontal: width * 0.05),
        child: Consumer<HomeProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return ListView(
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          enabled: homeProvider.isLoading,
                          controller: homeProvider.firstNameController,
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
                          enabled: homeProvider.isLoading,
                          controller: homeProvider.lastNameController,
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
                          enabled: false,
                          controller: homeProvider.emailController,
                          decoration: textFieldDecoration(""),
                        ),
                      ],
                    )),
                SizedBox(
                  height: height * 0.1,
                ),
                Consumer<HomeProvider>(
                  builder: (context, value, child) {
                    return ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue)),
                        onPressed: homeProvider.isLoading
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  homeProvider.updateUserData(
                                    homeProvider.firstNameController.text,
                                    homeProvider.lastNameController.text,
                                  );
                                  homeProvider.setLoading(false);
                                }
                              }
                            : makeItEditable,
                        child: homeProvider.isLoading
                            ? const Text(
                                "Done",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              )
                            : const Text(
                                "Edit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ));
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Do you want to logout?'),
          actions: [
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                final provider =
                    Provider.of<HomeProvider>(context, listen: false);
                provider.logoutUser(context);
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}

InputDecoration textFieldDecoration(String title) {
  return InputDecoration(
    hintText: title,
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.blue, width: 1.5)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.blue, width: 1.5)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.blue, width: 1.5)),
  );
}
