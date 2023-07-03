import 'package:easy_chat/constants/routes.dart';
import 'package:easy_chat/ui/chat_screen.dart';
import 'package:easy_chat/ui/main_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onPageGenerated(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return _getPageRoute(
          routeName: settings.name!,
          view: const MainScreen(),
        );
      case Routes.chat:
        return _getPageRoute(
          routeName: settings.name!,
          view: const ChatScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static PageRoute _getPageRoute(
      {required String routeName, required Widget view}) {
    return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => view,
    );
  }
}
