import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../components/custom_text_field.dart';

class RegisterPage extends StatefulWidget{
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();

}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
            Text("Let's cook up your account!",
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
            CustomTextField(
                controller: confirmPasswordController,
                hintText: "Confirm your password",
                obscureText: true),

            const SizedBox(height: 20,),
            CustomButton(
                onTap:(){},
                label: "Sign Up"
            ),
            const SizedBox(height: 25,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                  style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Login now",
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