import 'package:flutter/material.dart';
import 'package:sparrow/core/routes/fade_page_route.dart';
import 'package:sparrow/domain/entities/sneaker.dart';
import 'package:sparrow/presentation/authentication/login_page.dart';
import 'package:sparrow/presentation/authentication/signup_page.dart';
import 'package:sparrow/presentation/bag/bag_page.dart';
import 'package:sparrow/presentation/main/main_page.dart';
import 'package:sparrow/presentation/profile/profile_page.dart';
import 'package:sparrow/presentation/sneaker_details/sneaker_details_page.dart';

class Routes {
  static Route<dynamic>? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case MainPage.routeName:
        return MaterialPageRoute(builder: (context) => const MainPage());
      case BagPage.routeName:
        return MaterialPageRoute(builder: (context) => const BagPage());
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case SignUpPage.routeName:
        return MaterialPageRoute(builder: (context) => const SignUpPage());
      case ProfilePage.routeName:
        return MaterialPageRoute(builder: (context) => const ProfilePage());
      case SneakerDetailsPage.routeName:
        return FadePageRoute(
          builder: (context) {
            final sneaker = settings.arguments as Sneaker;
            return SneakerDetailsPage(sneaker: sneaker);
          },
        );
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
