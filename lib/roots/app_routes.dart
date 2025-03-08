import 'package:get/get.dart';
import 'package:pizza_app/views/auth/done_view.dart';
import 'package:pizza_app/views/auth/forgot_view.dart';
import 'package:pizza_app/views/auth/login_view.dart';
import 'package:pizza_app/views/auth/otp_view.dart';
import 'package:pizza_app/views/auth/register_view.dart';
import 'package:pizza_app/views/auth/reset_password_view.dart';
import 'package:pizza_app/views/dashboard/dashboard_view.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String dashboard = '/dashboard';
  static const String forgotPassword = '/forgot';
  static const String otp = '/otp';
  static const String resetPassword = '/reset';
  static const String done = '/done';

  static List<GetPage> routes = [
    GetPage(name: login, page: () => LoginView()),
    GetPage(name: register, page: () =>  RegisterView()), // Corrected
    GetPage(name: dashboard, page: () => const DashboardView()),
    GetPage(name: forgotPassword, page: () => const Forgotview()), // Fixed Naming
    GetPage(name: otp, page: () => const OtpView()),
    GetPage(name: resetPassword, page: () => const ResetPasswordview()), // Fixed Naming
    GetPage(name: done, page: () => const DoneView()),
    
  ];
}
