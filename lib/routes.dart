import 'package:flutter/material.dart';
import 'package:socialchamptask/features/users/pages/user_detail_page.dart';
import 'package:socialchamptask/network/domain/entities/users/users_list_entity.dart';

class Routes {
  static const String userDetail = '/userDetail';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case userDetail:
        if (settings.arguments is UserEntity) {
          return MaterialPageRoute(
            builder: (_) => UserDetailPage(user: settings.arguments as UserEntity),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      ),
    );
  }
}
