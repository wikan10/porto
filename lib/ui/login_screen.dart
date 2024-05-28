import 'package:flutter/material.dart';
import 'package:myapp/colors/global.colors.dart';
import 'package:myapp/ui/register_screen.dart';
import 'package:myapp/widgets/button.form.dart';
import 'package:myapp/widgets/social.login.dart';
import 'package:myapp/widgets/text.form.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: FadeTransition(
            opacity: _animation,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: FadeTransition(
                      opacity: _animation,
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
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FadeTransition(
                    opacity: _animation,
                    child: Text(
                      'Login ke Akun Anda',
                      style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // EMAIL INPUT
                  FadeTransition(
                    opacity: _animation,
                    child: TextForm(
                        controller: emailController,
                        text: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  //
                  // PASSWORD INPUT
                  FadeTransition(
                    opacity: _animation,
                    child: TextForm(
                        controller: passwordController,
                        text: 'Password',
                        keyboardType: TextInputType.text,
                        obscureText: true),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  FadeTransition(
                    opacity: _animation,
                    child: ButtonLogin(),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  FadeTransition(
                    opacity: _animation,
                    child: SocialLogin(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tidak Punya Akun?'),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: GlobalColors.mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
