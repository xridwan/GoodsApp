import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goods_app/presenter/pages/asset_page.dart';
import 'package:goods_app/presenter/pages/input_asset_page.dart';
import 'package:goods_app/presenter/widgets/main_header_widget.dart';

import '../bloc/auth_provider.dart';
import '../bloc/logout/logout_cubit.dart';
import '../bloc/logout/logout_state.dart';
import 'home_page.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return BlocConsumer<LogoutCubit, LogoutState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                MainHeaderWidget(
                  onLogout: () {
                    context.read<LogoutCubit>().logout();
                  },
                ),
                Expanded(
                  child: IndexedStack(
                    index: currentIndex,
                    children: [HomePage(), AssetPage()],
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InputAssetPage(),
                  ),
                );
              },
              shape: const CircleBorder(),
              backgroundColor: Colors.blue,
              child: const Icon(Icons.add, color: Colors.white),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.blue,
              backgroundColor: Colors.white,
              currentIndex: currentIndex,
              onTap: (index) {
                ref.read(bottomNavIndexProvider.notifier).state = index;
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                  tooltip: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive),
                  label: "Asset",
                  tooltip: "Asset",
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is LogoutSuccess) {
          Navigator.pushReplacementNamed(context, '/');
        } else if (state is LogoutFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
    );
  }
}
