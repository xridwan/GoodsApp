import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/app_injection.dart';
import '../bloc/me/me_cubit.dart';
import '../bloc/me/me_state.dart';
import 'button_primary_widget.dart';
import 'custom_dialog_widget.dart';

class MainHeaderWidget extends StatelessWidget {
  final VoidCallback onLogout;

  const MainHeaderWidget({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo_horizontal_black.png',
                  width: 107,
                  height: 32,
                ),
                const Text('TEST QTI', style: TextStyle(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 23),

            Row(
              children: [
                ClipRect(
                  child: Image.asset(
                    'assets/images/profile_placeholder.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                const SizedBox(width: 10),

                Expanded(
                  child: BlocProvider(
                    create: (context) => MeCubit(sl())..fetchMe(),
                    child: BlocConsumer<MeCubit, MeState>(
                      listener: (context, state) {
                        if (state is MeFailure) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/login',
                            (route) => false,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is MeLoading) {
                          return const Text("Loading...");
                        } else if (state is MeSuccess) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.user.username ?? "",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                state.user.email ?? "",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ],
                          );
                        } else if (state is MeFailure) {
                          return Text("Error: ${state.message}");
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                ButtonPrimaryWidget(
                  text: 'Logout',
                  width: 73,
                  height: 32,
                  fontSize: 10,
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => CustomDialogWidget(
                        title: "Logout",
                        desc:
                            "When you want to use this app,\nyou have to relog, are you sure?",
                        onAccept: onLogout,
                        onCancel: () {
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
