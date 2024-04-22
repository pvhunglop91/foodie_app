import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/components/button/app_elevated_button.dart';
import 'package:food_app/pages/auth/login_page.dart';
import 'package:food_app/pages/auth/register_page.dart';
import '../gen/assets.gen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const textStyle = TextStyle(color: Colors.brown, fontSize: 14.0);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Image.asset(
              Assets.images.backgrFoodie.path,
              width: size.width,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 0.0,
            top: size.height / 2.0,
            right: 0.0,
            bottom: 72.0,
            child: Column(
              children: [
                const Text('Welcome',
                    style: TextStyle(color: Colors.red, fontSize: 32.0)),
                const Text('Lorem ipsum dolor sit amet, consect-',
                    style: textStyle),
                const Text('tetur adipiscing elit. Vivamus et felis',
                    style: textStyle),
                const Text('dolor. Donec vitae facilisis velit.',
                    style: textStyle),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                          horizontal: 20.0) // -> o day ne
                      .copyWith(bottom: 20.0),
                  child: AppElevatedButton(
                      onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                            (Route<dynamic> route) => false,
                          ),
                      text: 'Login'),
                ),
                // const SizedBox(height: 20.0),  khong can Sizebox, minh copy with bottom mo nut tren luon
                //name constructor
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: AppElevatedButton.outline(
                      onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()),
                            (Route<dynamic> route) => false,
                          ),
                      text: 'Sign Up'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
