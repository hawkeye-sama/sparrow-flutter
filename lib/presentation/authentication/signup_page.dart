import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparrow/core/widgets/custom_outlined_button.dart';
import 'package:sparrow/core/widgets/custom_textfield.dart';
import 'package:sparrow/presentation/authentication/cubits/auth_cubit.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const routeName = '/signup';

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      body: Material(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.deepPurpleAccent.shade200,
                    theme.primaryColor,
                  ],
                ),
              ),
            ),
            Positioned(
              top: -70,
              left: -70,
              child: Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF27A9F7),
                ),
              ),
            ),
            Positioned(
              top: -50,
              right: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF9C27B0),
                ),
              ),
            ),
            // Flutter logo in top center
            Positioned(
              top: mediaQuery.size.height * 0.1,
              left: mediaQuery.size.width * 0.5 - 50,
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Center(
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: mediaQuery.size.height * 0.25 - mediaQuery.viewInsets.bottom,
              child: Hero(
                tag: 'signup',
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 7,
                          spreadRadius: 3,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20,
                          mediaQuery.viewInsets.bottom > 0 ? 60 : 20, 20, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 40),
                          const Text(
                            'Welcome!',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Please sign up to continue',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            labelText: 'Email',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            labelText: 'Password',
                            obscureText: true,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            labelText: 'Verify Password',
                            obscureText: true,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomOutlinedButton(
                              text: 'SIGNUP',
                              onPressed: () {
                                context.read<AuthCubit>().logIn();
                                Navigator.pop(context);
                              }),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account?',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: theme.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'By continuing, you agree to our terms and conditions.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
