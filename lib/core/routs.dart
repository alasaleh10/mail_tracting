import 'package:go_router/go_router.dart';
import 'package:mail_tracking/main.dart';
import 'package:mail_tracking/view/home/screens/home.dart';
import 'package:mail_tracking/view/login/view/login.dart';
import 'package:mail_tracking/view/register/view/register.dart';

abstract class AppRouts {
  static const String login = '/';
  static const String register = '/register';
  static const String homeScreen = '/homeScreen';



 static final routs = GoRouter(

  redirect: (context, state) {
    if(sharedPref.getInt('id')!=null){
      return AppRouts.homeScreen;
    }
    return null;
  },
  
  
  routes: [
    GoRoute(
      path: login,
      builder: (context, state) => const Login(),
     
    ),
     GoRoute(
      path: register,
      builder: (context, state) => const Register(),
    ),  GoRoute(
      path: homeScreen,
      builder: (context, state) => const HomeScreen(),
    )
  ]);
  
}
