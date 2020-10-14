import 'package:get/get.dart';

import 'package:conversor_de_moedas/app/modules/historic/historic_controller.dart';

class HistoricBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoricController>(
      () => HistoricController(),
    );
  }
}
