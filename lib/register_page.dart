import 'package:flutter/material.dart';
import 'package:login_demo/widgets/button.dart';
import 'package:login_demo/widgets/input_fields.dart';
import 'package:login_demo/widgets/shortcuts_words.dart';

import 'login_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(children:  [
          const SizedBox(height: 40,),
          Center(
            child: Image.asset(('assets/logo.png'),
            width: MediaQuery.of(context).size.width*0.6,),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              children: [
               const Text('Sign Up',
                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                 textAlign: TextAlign.start,
               ),
                const SizedBox(height: 10,),
                Form(
                    key: RegisterScreen._registerFormKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: Column(
                        children: [
                          RoundedInputField2(
                            validator: (value) {
                              RegExp regex = RegExp(r'^.{3,}$');
                              if (value!.isEmpty) {
                                return ("User Name cannot be null");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Enter a Valid Name(Min, 3 Characters)");
                              }
                              return null;
                            },
                            controller: nameController,
                            hintText: "User Name",
                            icon: Icons.account_circle,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RoundedInputField2(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Please Enter your Email");
                              }
                              if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return ("please Enter a Valid Email");
                              }
                              return null;
                            },
                            controller: emailController,
                            hintText: "Email",
                            icon: Icons.email,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RoundedInputField2(
                            validator: (value) {
                              RegExp regex = RegExp(r'^.{6,}$');
                              if (value!.isEmpty) {
                                return ("Password is required for Register");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Please Enter a Valid Password(Min, 6 Characters)");
                              }
                            },
                            controller: passwordController,
                            icon: Icons.key,
                            hintText: 'Password',
                            isPassword: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                           RoundedButton(
                            text: 'Sign up',
                            press: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const LoginScreen()));
                              //signUp(emailController.text,passwordController.text);
                            },
                          ),
                          UnderPart(
                              navigatorText: "Login here",
                              title: "Already have an account?",
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const LoginScreen()));
                              }),
                        ],
                      ),
                    )),


              ],
            ),
          )
        ],),
      ),
    ));
  }
}
