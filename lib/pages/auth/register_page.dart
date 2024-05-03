import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/auth/login_page.dart';
import '../../components/button/app_elevated_button.dart';
import '../../components/text_field/app_text_field.dart';
import '../../components/text_field/app_text_field_password.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  late bool isCheck;

  @override
  void initState() {
    super.initState();
    isCheck = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
              top: MediaQuery.of(context).padding.top + 46, bottom: 20.0),
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Register',
              style: TextStyle(color: Colors.red, fontSize: 24.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4.0),
            const Text(
              'Create your new account',
              style: TextStyle(color: Colors.grey, fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60.0),
            AppTextField(
              controller: emailController,
              hintText: 'Full Name',
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16.0),
            AppTextField(
              controller: nameController,
              hintText: 'Email or Phone',
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16.0),
            AppTextFieldPassword(
              controller: passwordController,
              hintText: 'Password',
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16.0),
            AppTextFieldPassword(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 40.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => setState(() => isCheck = !isCheck),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0, bottom: 6.0),
                    child: Icon(
                      isCheck
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank,
                      size: 20.0,
                      color: Colors.red,
                    ),
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'I agree to your',
                      style: const TextStyle(color: Colors.grey),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: ' privacy policy',
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        const TextSpan(text: ' and'),
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: ' term & conditions',
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            AppElevatedButton(
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (Route<dynamic> route) => false,
                    ),
                text: 'Sign Up'),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already an account, ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.8,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  ),
                  child: const Text(
                    'Login',
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
    );
  }
}
