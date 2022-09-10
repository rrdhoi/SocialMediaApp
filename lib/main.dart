import 'package:flutter/material.dart';
import 'package:social_media_app/app/configs/theme.dart';
import 'package:social_media_app/app/resources/constant/named_routes.dart';
import 'package:social_media_app/ui/pages/home_page.dart';
import 'package:social_media_app/ui/pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media App',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case NamedRoutes.homeScreen:
            return MaterialPageRoute(builder: (context) => const HomePage());
          case NamedRoutes.profileScreen:
            return MaterialPageRoute(
              builder: (context) => const ProfilePage(),
            );
          default:
            return MaterialPageRoute(builder: (context) => const HomePage());
        }
      },
    );
  }
}
