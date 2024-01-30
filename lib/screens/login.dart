// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Implement some initialization operations here.
  }

  @override
  Widget build(BuildContext context) {
    final authProvider=Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'enter email',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(hintText: 'enter password'),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                if(emailController.text.isEmpty || passwordController.text.isEmpty){
                   showDialog(context: context, builder: (context) => AlertDialog(
                     title: Text('Please enter valid email and password'),
                     actions: [
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text('Ok'))
                     ],
                   ));
                }
                authProvider.login(emailController.text.toString(), passwordController.text.toString(),context);
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Center(child: authProvider.loading ? CircularProgressIndicator() : Text('Login',
                style: TextStyle(fontSize: 20,color: Colors.black),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
