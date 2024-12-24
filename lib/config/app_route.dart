

import 'package:delevery_app/pages/client_page.dart';
import 'package:delevery_app/pages/delevery_screen.dart';
import 'package:delevery_app/pages/reset_password_page.dart';
import 'package:delevery_app/pages/sign_up_page.dart';

import '../pages/login_page.dart';

class AppRoute{
  static final pages=  {
  login: (context) => LoginPage(),

    resetPassword: (context)=>ResetPassword(),
    signUp:(context)=>SignUp(),
    clientPage:(context)=>Client(),
    deleveryPage:(context)=>DeliveryPage(),
  };
  static const login = '/';
  static const resetPassword='/resetPassword';
  static const signUp='/signUp';
  static const clientPage='/clientPage';
  static const deleveryPage='/deleveryPage';

}