import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparrow/core/routes/routes.dart';
import 'package:sparrow/core/theme/custom_theme_data.dart';
import 'package:sparrow/presentation/authentication/cubits/auth_cubit.dart';
import 'package:sparrow/presentation/bag/cubit/bag_cubit.dart';
import 'package:sparrow/presentation/home/cubit/brand_cubit.dart';
import 'package:sparrow/presentation/authentication/login_page.dart';
import 'package:sparrow/presentation/main/cubit/page_cubit.dart';
import 'package:sparrow/presentation/main/main_page.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => BrandCubit(),
        ),
        BlocProvider(
          create: (context) => BagCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit()..checkAuthStatus(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenerate,
        theme: CustomThemeData.light,
        home: BlocBuilder<AuthCubit, AuthStatus>(
          builder: (context, authStatus) => Material(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: authStatus == AuthStatus.authenticated
                  ? const MainPage()
                  : const LoginPage(),
            ),
          ),
        ),
      ),
    );
  }
}
