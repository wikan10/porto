import 'package:flutter/material.dart';
import 'package:myapp/colors/global.colors.dart';
import 'package:myapp/widgets/button.register.dart';
import 'package:myapp/widgets/social.register.dart';
import 'package:myapp/widgets/text.form.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        iconTheme: IconThemeData(color: GlobalColors.mainColor),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Buat Akun Anda',
                style: TextStyle(
                  color: GlobalColors.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // EMAIL INPUT
              TextForm(
                  controller: emailController,
                  text: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false),

              SizedBox(
                height: 10,
              ),
              //
              // PASSWORD INPUT
              TextForm(
                  controller: passwordController,
                  text: 'Password',
                  keyboardType: TextInputType.text,
                  obscureText: true),
              SizedBox(
                height: 10,
              ),
              //
              // CONFIRM PASSWORD INPUT
              TextForm(
                  controller: confirmPasswordController,
                  text: 'Konfirmasi Password',
                  keyboardType: TextInputType.text,
                  obscureText: true),

              SizedBox(
                height: 25,
              ),
              ButtonRegister(),

              SizedBox(
                height: 25,
              ),
              SocialRegister(),
            ],
          ),
        )),
      ),
    );
  }
}
