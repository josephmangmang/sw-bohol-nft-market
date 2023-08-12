import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nftmarket/add_nft_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: IconButton.filledTonal(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    ),
                    const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              // Email and password login
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: emailTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              const SizedBox(height: 16),
                Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  obscureText: true,
                  controller: passwordTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Login button
              FilledButton.tonal(
                onPressed: () async {
                  final email = emailTextController.text;
                  final password = passwordTextController.text;
                  print('Email: $email, Password: $password');

                  if (email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.maybeOf(context)
                        ?.showSnackBar(SnackBar(content: Text('Email or password is empty')));
                    return;
                  }
                  try {
                    final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    print('User: ${userCredential.user?.email}');

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddNftPage()));
                  } catch (error) {
                    ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(content: Text(error.toString())));
                  }
                },
                child: const Center(child: Text('Login')),
              ),
              const SizedBox(height: 16),
              // Login button
              FilledButton.tonal(
                onPressed: ()async{
                  final email = emailTextController.text;
                  final password = passwordTextController.text;
                  print('Email: $email, Password: $password');

                  if (email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.maybeOf(context)
                        ?.showSnackBar(SnackBar(content: Text('Email or password is empty')));

                    return;
                  }
                  try {
                    final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    print('User: ${userCredential.user?.email}');

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddNftPage()));
                  } catch (error) {
                    ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(content: Text(error.toString())));
                  }

                },
                child: const Center(child: Text('Signup')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
