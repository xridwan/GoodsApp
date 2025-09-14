import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goods_app/core/di/app_injection.dart';
import 'package:goods_app/presenter/bloc/asset/asset_cubit.dart';
import 'package:goods_app/presenter/bloc/assetbyloc/asset_by_loc_cubit.dart';
import 'package:goods_app/presenter/bloc/assetbystatus/asset_by_status_cubit.dart';
import 'package:goods_app/presenter/bloc/createasset/create_asset_cubit.dart';
import 'package:goods_app/presenter/bloc/delete_asset/delete_asset_cubit.dart';
import 'package:goods_app/presenter/bloc/detail_asset/detail_asset_cubit.dart';
import 'package:goods_app/presenter/bloc/location/location_cubit.dart';
import 'package:goods_app/presenter/bloc/login/login_cubit.dart';
import 'package:goods_app/presenter/bloc/logout/logout_cubit.dart';
import 'package:goods_app/presenter/bloc/me/me_cubit.dart';
import 'package:goods_app/presenter/bloc/status/status_cubit.dart';
import 'package:goods_app/presenter/bloc/token/token_cubit.dart';
import 'package:goods_app/presenter/bloc/update_asset/update_asset_cubit.dart';
import 'package:goods_app/presenter/pages/edit_asset_page.dart';
import 'package:goods_app/presenter/pages/input_asset_page.dart';
import 'package:goods_app/presenter/pages/login_page.dart';
import 'package:goods_app/presenter/pages/main_page.dart';
import 'package:goods_app/presenter/pages/splash_page.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<LoginCubit>()),
        BlocProvider(create: (context) => sl<TokenCubit>()),
        BlocProvider(create: (context) => sl<LogoutCubit>()),
        BlocProvider(create: (context) => sl<MeCubit>()),
        BlocProvider(create: (context) => sl<AssetByStatusCubit>()),
        BlocProvider(create: (context) => sl<AssetByLocCubit>()),
        BlocProvider(create: (context) => sl<StatusCubit>()),
        BlocProvider(create: (context) => sl<LocationCubit>()),
        BlocProvider(create: (context) => sl<CreateAssetCubit>()),
        BlocProvider(create: (context) => sl<AssetsCubit>()),
        BlocProvider(create: (context) => sl<DetailAssetCubit>()),
        BlocProvider(create: (context) => sl<DeleteAssetCubit>()),
        BlocProvider(create: (context) => sl<UpdateAssetCubit>()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.redHatDisplayTextTheme(),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/login': (context) => const LoginPage(),
          '/main': (context) => const MainPage(),
          '/input': (context) => const InputAssetPage(),
          '/edit': (context) => EditAssetPage(
            id: ModalRoute.of(context)?.settings.arguments as String?,
          ),
        },
      ),
    );
  }
}
