import 'package:flutter/material.dart';
import 'package:login_demo/register_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child:
      Column(
        children: [
          const SizedBox(height: 50,),
          Center(
            child: ElevatedButton(onPressed: (){
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const RegisterScreen()));
            },
                child: const Text('Register Page')),
          )
        ],
      ),),
    );
  }
}
