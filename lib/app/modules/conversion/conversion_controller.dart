import 'package:conversor_de_moedas/app/data/model/conversion_historic_model.dart';
import 'package:conversor_de_moedas/app/data/model/conversion_model.dart';
import 'package:conversor_de_moedas/app/data/repository/conversersion_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';

class ConversionController extends GetxController {
  final ConversionRepository repository;
  final count = 0.obs;
  final dropdownValue = 'USD'.obs;
  final textcontroller = TextEditingController().obs;
  final textcontroller2 = TextEditingController().obs;
  final dropdownValue2 = 'USD'.obs;

  // final box = GetStorage();

  @override
  onInit() async {
    await _abrirCaixa();

    box = await Hive.openBox('historic');
  }

  final resultado2 = HistoricConversionModel().obs;
  List<String> moedas = [
    'CAD',
    'HKD',
    'ISK',
    'PHP',
    'DKK',
    'HUF',
    'CZK',
    'GBP',
    'RON',
    'SEK',
    'IDR',
    'INR',
    'BRL',
    'RUB',
    'HRK',
    'JPY',
    'THB',
    'CHF',
    'EUR',
    'MYR',
    'BGN',
    'TRY',
    'CNY',
    'NOK',
    'NZD',
    'ZAR',
    'USD',
    'MXN',
    'SGD',
    'AUD',
    'ILS',
    'KRW',
    'PLN',
  ].obs;
  ConversionController(this.repository);
  final conversionModel = ConversionModel().obs;
  var box;
  Future _abrirCaixa() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    return await Hive.openBox('historic');
  }

  initBox() async {
    box = await Hive.openBox('historic');
  }


  convert() async {
    await getAllEvents(dropdownValue.value, dropdownValue2.value);
    // await _abrirCaixa();

    // var box2 = await Hive.openBox('historic');

    double y = double.parse(textcontroller.value.text);

    double x = conversionModel.value.rates[dropdownValue2.value];

    double resultado = y * x;
    resultado.toStringAsFixed(2);
    print(resultado.toStringAsFixed(2));

    textcontroller2.value.text = resultado.toStringAsFixed(2);

    HistoricConversionModel result = HistoricConversionModel(
        moedaBase: dropdownValue.value,
        moedaDesejada: dropdownValue2.value,
        date: conversionModel.value.date,
        valor_base: y,
        valor_desejado: resultado);

        box.add(result.toJson());

    // box.write('historic', result.toJson());

    // HistoricConversionModel result2 =
    //     HistoricConversionModel.fromJson(box.read('historic'));

    // print(result2);
  }

  getAllEvents(String moeda, String moeda2) async {
    print('chamou conversão');
    await repository.getAll(moeda, moeda2).then((data) {
      conversionModel.value = data;
    });
  }

  increment() => count.value++;
}
