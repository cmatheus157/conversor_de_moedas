import 'package:conversor_de_moedas/app/data/model/conversion_historic_model.dart';
import 'package:conversor_de_moedas/app/modules/conversion/conversion_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:conversor_de_moedas/app/modules/historic/historic_controller.dart';

class HistoricView extends GetView<HistoricController> {
  final ConversionController conversionController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Histórico '),
          actions: [],
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: conversionController.box.length,
            itemBuilder: (context, index) {
              conversionController.resultado2.value =
                  HistoricConversionModel.fromJson(
                      conversionController.box.getAt(index));
              return ListTile(
                subtitle: Text(conversionController.resultado2.value.valor_base
                        .toString() +
                    ' ' +
                    conversionController.resultado2.value.moedaBase +
                    ' para ' +
                    conversionController.resultado2.value.valor_desejado
                        .toString() +
                    ' ' +
                    conversionController.resultado2.value.moedaDesejada),
                title: Text(conversionController.resultado2.value.moedaBase +
                    ' para ' +
                    conversionController.resultado2.value.moedaDesejada
                        .toString()),
              );
            }));
  }
}
