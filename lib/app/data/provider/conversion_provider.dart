import 'dart:convert';
import 'package:conversor_de_moedas/app/data/model/conversion_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class ConversionProvider {
  final Dio httpClient;
  ConversionProvider({@required this.httpClient});

  getAllConversion(String moeda,String moeda2) async {
    try {
      var response = await httpClient.get('symbols=$moeda2&base=$moeda');
      if (response.statusCode == 200) {
        ConversionModel jsonResponse = ConversionModel.fromJson(response.data);

        return jsonResponse;
      } else
        print('erro -get');
    } catch (_) {}
  }
}
