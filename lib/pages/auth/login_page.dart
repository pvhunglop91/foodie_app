import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/components/button/app_elevated_button.dart';
import 'package:food_app/components/text_field/app_text_field.dart';
import 'package:food_app/components/text_field/app_text_field_password.dart';
import 'package:food_app/pages/auth/register_page.dart';

import '../cart/cart_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
                top: MediaQuery.of(context).padding.top + 90, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Welcome Back',
                  style: TextStyle(color: Colors.red, fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4.0),
                const Text(
                  'Login to your account',
                  style: TextStyle(color: Colors.grey, fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60.0),
                AppTextField(
                  controller: emailController,
                  hintText: 'Email or Phone',
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16.0),
                AppTextFieldPassword(
                  controller: passwordController,
                  hintText: 'Password',
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 4.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                AppElevatedButton(
                    onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const CartPage()),
                          (Route<dynamic> route) => false,
                        ),
                    text: 'Login'),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account, ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.8,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      ),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.8,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
