import 'package:conversor_de_moedas/app/modules/conversion/const.dart';
import 'package:conversor_de_moedas/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'conversion_controller.dart';

class ConversionView extends GetView<ConversionController> {
  @override
  void initState() {}
  // String dropdownValue;

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _statusSel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            onPressed: () {
              Get.toNamed(Routes.HISTORIC);
            },
            child: Text('historico'),
          )
        ],
        title: Text('Conversão de Moeda'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: DropdownButton(
                      isExpanded: true,
                      value: controller.dropdownValue.value,
                      onChanged: (String newValue) {
                        controller.dropdownValue.value = newValue;
                      },
                      items: controller.moedas
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: controller.textcontroller.value,
                  decoration: InputDecoration(hintText: 'Valor R\$ '),
                  keyboardType: TextInputType.number,
                ),
              ),
              Obx(() => Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: DropdownButton(
                      isExpanded: true,
                      value: controller.dropdownValue2.value,
                      onChanged: (String newValue) {
                        controller.dropdownValue2.value = newValue;
                      },
                      items: controller.moedas
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: controller.textcontroller2.value,
                  decoration: InputDecoration(hintText: 'Novo Valor'),
                  keyboardType: TextInputType.number,
                ),
              ),
              FlatButton(
                  onPressed: () async {
                    print(controller.dropdownValue.value);
                    controller.convert();
                  },
                  child: Text('Converter'))
            ],
          ),
        ),
      ),
    );
  }
}
