import 'package:flutter/material.dart';
import 'package:flutter_bloc_sample/app_constants.dart';
import 'package:flutter_bloc_sample/features/home/presentation/views/home_screen.dart';
import 'package:flutter_bloc_sample/features/home/presentation/views/widgets/app_button.dart';
import 'package:flutter_bloc_sample/features/home/presentation/views/widgets/app_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    void _signIn() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 120,
          ),
          const Text(
            AppConstants.login,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextField(
              textController: emailController,
              hintText: AppConstants.type_your_username,
              icon: Icons.email),
          const SizedBox(
            height: 20,
          ),
          AppTextField(
              textController: passwordController,
              hintText: AppConstants.type_your_password,
              icon: Icons.password_sharp),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
              onTap: () {
                _signIn();
              },
              child: const AppButton(
                text: AppConstants.login,
              )),
          const SizedBox(
            height: 30,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
