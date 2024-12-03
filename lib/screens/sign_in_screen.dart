import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heywork/widgets/button_primary_widget.dart';
import 'package:heywork/utils/colors.dart';
import 'package:heywork/widgets/textfield_widget.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = '/sign_in-screen';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailOrPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(width / 11, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Let's sign you in",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: primary),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Great to have you back!",
                      style: TextStyle(
                          fontSize: 20,
                          color: hints,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField1(
              multiInput: true,
              controller: _emailOrPhoneController,
              hintText: "Phone number or Email",
              prefixIcon: Icon(
                Icons.mail,
                color: primary,
              ),
              obscureText: false,
              isPhoneNumberMode: true,
            ),
            const SizedBox(height: 16),
            TextField1(
              multiInput: false,
              controller: _passwordController,
              hintText: "Password",
              prefixIcon: Icon(
                Icons.lock,
                color: primary,
              ),
              obscureText: true,
              isPhoneNumberMode: false,
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => {},
              child: const Text(
                "Forgot password?",
                style: TextStyle(color: links),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () => {},
                    icon: Image.asset(
                      'assets/icons/google.png',
                      height: 24,
                    )),
                IconButton(
                    onPressed: () => {},
                    icon: Image.asset(
                      'assets/icons/facebook.png',
                      height: 24,
                    )),
                IconButton(
                    onPressed: () => {},
                    icon: Image.asset(
                      'assets/icons/microsoft.png',
                      height: 24,
                    )),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: () => {},
                  child: const Text(
                    "Register",
                    style: TextStyle(
                        color: links,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ButtonPrimary(btnText: "Sign In", onTap: () => {})
          ],
        ),
      ),
    );
  }
}
