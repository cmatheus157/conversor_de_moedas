import 'package:conversor_de_moedas/app/modules/conversion/conversion_binding.dart';
import 'package:conversor_de_moedas/app/modules/conversion/conversion_view.dart';
import 'package:conversor_de_moedas/app/modules/historic/historic_view.dart';
import 'package:conversor_de_moedas/app/modules/historic/historic_binding.dart';
import 'package:conversor_de_moedas/app/modules/login/login_view.dart';
import 'package:conversor_de_moedas/app/modules/login/login_binding.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HISTORIC,
      page: () => HistoricView(),
      binding: HistoricBinding(),
    ),
    GetPage(
      name: Routes.CONVERSION,
      page: () => ConversionView(),
      binding: ConversionBinding(),
    ),
  ];
}
