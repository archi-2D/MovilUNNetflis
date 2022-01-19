import 'package:flutter/cupertino.dart';
import 'package:mobile_component/src/view/pages/Home/home_page.dart';
import 'package:mobile_component/src/view/pages/Login/forgot_pass_page.dart';
import 'package:mobile_component/src/view/pages/Login/login_page.dart';
import 'package:mobile_component/src/view/pages/Register/register_page.dart';
import 'package:mobile_component/src/view/pages/comments/comments_page.dart';
import 'package:mobile_component/src/view/pages/comments/comments_rate_page.dart';
import 'package:mobile_component/src/view/pages/comments/comments_view_rate_page.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const LoginPage(),
    'forgotPass': (BuildContext context) => const ForgotPassPage(),
    'register': (BuildContext context) => const RegisterPage(),
    'home': (BuildContext context) => const HomePage(), //Poner SplashScreen
    'comments': (BuildContext context) => const CommentsPage(),
    'comments/rate': (BuildContext context) => const CommentsRatePage(),
    'comments/viewRate': (BuildContext context) => const CommentsViewRatePage(),
    //'/': (BuildContext context) => SplashScreen(),
  };
}
