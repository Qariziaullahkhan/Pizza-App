import 'package:get/get_navigation/get_navigation.dart';
import 'package:pizza_app/views/auth/done_view.dart';
import 'package:pizza_app/views/auth/forgot_view.dart';
import 'package:pizza_app/views/auth/login_view.dart';
import 'package:pizza_app/views/auth/otp_view.dart';
import 'package:pizza_app/views/auth/reset_password_view.dart';
import 'package:pizza_app/views/auth/signup_screen.dart';
import 'package:pizza_app/views/dashboard/dashboard_view.dart';

class AppRoutes {
  static const String register = '/register';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String forgotPassword = '/forgot';
  static const String otp = '/otp';
  static const String resetPassword = '/reset';
  static const String done = '/done';

  static List<GetPage> routes = [
    GetPage(name: register, page: () => const RegisterView()),
    GetPage(name: login, page: () => const Loginview()),
    GetPage(name: dashboard, page: () => const DashboardView()),
    GetPage(name: forgotPassword, page: () => const Forgotview()),
    GetPage(name: otp, page: () => const OtpView()),
    GetPage(name: resetPassword, page: () => const ResetPasswordview()),
    GetPage(name: done, page: () => const DoneView()),
  ];

}
