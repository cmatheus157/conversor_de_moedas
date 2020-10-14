import 'package:conversor_de_moedas/app/data/provider/conversion_provider.dart';
import 'package:conversor_de_moedas/app/data/repository/conversersion_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'conversion_controller.dart';

class ConversionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConversionController>(() => ConversionController(
          ConversionRepository(
            ConversionProvider(
                httpClient: Dio(BaseOptions(
                    baseUrl: 'https://api.exchangeratesapi.io/latest?'))),
          ),
        ));
  }
}
