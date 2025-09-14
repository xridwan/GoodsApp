import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goods_app/presenter/widgets/button_primary_widget.dart';
import 'package:goods_app/presenter/widgets/login_header_widget.dart';
import 'package:goods_app/presenter/widgets/text_field_custom_widget.dart';

import '../bloc/login/login_cubit.dart';
import '../bloc/login/login_state.dart';
import '../bloc/token/token_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TokenCubit tokenCubit;

  bool showEmailError = false;
  bool showPasswordError = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    setState(() {
      showEmailError = emailController.text.trim().isEmpty;
      showPasswordError = passwordController.text.trim().isEmpty;
    });

    if (!showEmailError && !showPasswordError) {
      context.read<LoginCubit>().login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, loginState) {
              if (loginState is LoginSuccess) {
                Navigator.pushReplacementNamed(context, '/main');
              } else if (loginState is LoginFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(loginState.message)));
              }
            },
            builder: (context, loginState) {
              final isLoading = loginState is LoginLoading;

              return Column(
                children: [
                  const LoginHeaderWidget(),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        const SizedBox.square(dimension: 42),
                        TextFieldCustomWidget(
                          controller: emailController,
                          hintText: "Email",
                          icon: const Icon(
                            Icons.email_outlined,
                            color: Colors.grey,
                          ),
                          iconPassword: null,
                          showError: showEmailError,
                        ),
                        const SizedBox.square(dimension: 12),

                        TextFieldCustomWidget(
                          controller: passwordController,
                          hintText: "Password",
                          icon: const Icon(
                            Icons.lock_outline,
                            color: Colors.grey,
                          ),
                          iconPassword: Icon(
                            Icons.visibility,
                            color: Colors.blue.shade200,
                          ),
                          obscureText: true,
                          showError: showPasswordError,
                        ),

                        const SizedBox.square(dimension: 70),
                        ButtonPrimaryWidget(
                          text: isLoading ? 'Loading...' : 'Login',
                          fontSize: 16,
                          onPressed: () {
                            _onLoginPressed();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
