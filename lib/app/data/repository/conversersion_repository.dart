import 'package:conversor_de_moedas/app/data/provider/conversion_provider.dart';
import 'package:meta/meta.dart';

class ConversionRepository {
  final ConversionProvider apiClient;

  ConversionRepository(this.apiClient);

   getAll(String moeda,String moeda2) {
    return apiClient.getAllConversion(moeda,moeda2);
  }
  
}
