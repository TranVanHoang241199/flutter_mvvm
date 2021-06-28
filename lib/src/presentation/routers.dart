import 'package:flutter/material.dart';
import 'package:flutter_app/src/presentation/home/home.dart';
import 'package:flutter_app/src/presentation/shownotes/shown.dart';
import 'package:flutter_app/src/presentation/speak/speak.dart';

import 'Setting/setting.dart';
import 'Shownotesbook/shownb.dart';
import 'content/content.dart';
import 'navigation/navigation_screen.dart';

class Routers {
  static const String navigation = "/navigation";
  static const String home = "/home";
  static const String setting = "/setting";
  static const String ShowNd = "/ShowNd";
  static const String ShowN = "/ShowN";
  static const String Speak = "/Speak";
  static const String Content = "/Content";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var arguments = settings.arguments;
    switch (settings.name) {
      case navigation:
        return animRoute(NavigationScreen(), name: navigation);
      case home:
        return animRoute(HomeScreen(), name: home, beginOffset: _left);
      case setting:
        return animRoute(SettingScreen(), name: setting, beginOffset: _left);
      case ShowNd:
        return animRoute(ShowNdScreen(), name: ShowNd, beginOffset: _right);
      case ShowN:
        return animRoute(ShowNScreen(), name: ShowN, beginOffset: _right);
      case Speak:
        return animRoute(SpeakSc(), name: Speak, beginOffset: _top);
      case Content:
        return animRoute(ContentScreen(), name: Content, beginOffset: _center);

      default:
        return animRoute(
            Container(
                child: Center(
                    child: Text('No route defined for ${settings.name}'))),
            name: "/error");
    }
  }

  static Route animRoute(Widget page,
      {Offset? beginOffset, required String name, Object? arguments}) {
    return PageRouteBuilder(
      settings: RouteSettings(name: name, arguments: arguments),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = beginOffset ?? Offset(0.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Offset _center = Offset(0.0, 0.0);
  static Offset _top = Offset(0.0, 1.0);
  static Offset _bottom = Offset(0.0, -1.0);
  static Offset _left = Offset(-1.0, 0.0);
  static Offset _right = Offset(1.0, 0.0);
}
