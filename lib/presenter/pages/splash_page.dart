import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/token/token_cubit.dart';
import '../bloc/token/token_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2)).then((_) {
      context.read<TokenCubit>().fetchToken();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TokenCubit, TokenState>(
      listener: (context, state) {
        if (state is TokenLoaded) {
          Navigator.pushReplacementNamed(context, '/main');
        } else if (state is TokenEmpty) {
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
      child: Scaffold(
        body: Center(
          child: Image.asset(
            'assets/images/vertical_logo.png',
            width: 212,
            height: 108,
          ),
        ),
      ),
    );
  }
}
