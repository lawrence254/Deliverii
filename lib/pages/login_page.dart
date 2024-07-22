import 'package:delifood/components/CustomButton.dart';
import 'package:delifood/components/Textfields.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  final void Function()? onTap;
 const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color:Theme.of(context).colorScheme.inversePrimary
            ),
              const SizedBox(height: 20,),
            Text("Deli Foods Delivery",
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.inversePrimary
            ),
            ),

            const SizedBox(height: 20,),
            CustomTextField(
                controller: emailController,
                hintText: "Email address",
                obscureText: false),

            const SizedBox(height: 20,),
            CustomTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true),

            const SizedBox(height: 20,),
            CustomButton(
                onTap:(){},
                label: "Sign in"
            ),
            const SizedBox(height: 25,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?",
                  style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Register now",
                    style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold),

                  ),
                )

              ],
            )

          ],

        ),
      ),
    );
  }
}
