import 'package:get/get.dart';
import 'package:ibs_wallet/features/presentation/pages/enter_pin_screen.dart';
import 'package:ibs_wallet/features/presentation/pages/select_service_screen.dart';
import 'package:ibs_wallet/features/presentation/pages/transaction_success_screen.dart';
import '../bindings/app_binding.dart';
import '../pages/enter_amout_screen.dart';
import '../pages/mobile_number_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      title: AppRoutes.home,
      name: AppRoutes.home,
      transition: Transition.circularReveal,
      page: () => SelectServiceScreen(),
      binding: AppBindings(),
      preventDuplicates: true,
      popGesture: true,
      maintainState: true,
    ),
    GetPage(
      title: AppRoutes.enterMobile,
      name: AppRoutes.enterMobile,
      transition: Transition.circularReveal,
      page: () => MobileNumberEnterScreen(),
      binding: AppBindings(),
      preventDuplicates: true,
      popGesture: true,
      maintainState: true,
    ),
    GetPage(
      title: AppRoutes.enterAmount,
      name: AppRoutes.enterAmount,
      transition: Transition.circularReveal,
      page: () => EnterAmountScreen(),
      binding: AppBindings(),
      preventDuplicates: true,
      popGesture: true,
      maintainState: true,
    ),
    GetPage(
      title: AppRoutes.enterPin,
      name: AppRoutes.enterPin,
      transition: Transition.circularReveal,
      page: () => EnterPinScreen(),
      binding: AppBindings(),
      preventDuplicates: true,
      popGesture: true,
      maintainState: true,
    ),
    GetPage(
      title: AppRoutes.success,
      name: AppRoutes.success,
      transition: Transition.circularReveal,
      page: () => TransactionSuccessScreen(),
      binding: AppBindings(),
      preventDuplicates: true,
      popGesture: true,
      maintainState: true,
    ),
  ];

  ///Future Implementation
  //static final unknownRoute = GetPage(name: AppRoutes.unknown, page: () => NotFoundPage());
}

///auth_middleware.dart
/*class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool isAuthenticated = false; // Add your logic here
    return !isAuthenticated ? RouteSettings(name: route*//*AppRoutes.login*//*) : null;
  }
}*/
