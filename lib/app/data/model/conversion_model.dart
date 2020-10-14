// To parse this JSON data, do
//
//     final conversionModel = conversionModelFromJson(jsonString);

import 'dart:convert';

class ConversionModel {
    ConversionModel({
        this.rates,
        this.base,
        this.date,
    });

    Map<String, double> rates;
    String base;
    DateTime date;

    factory ConversionModel.fromRawJson(String str) => ConversionModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ConversionModel.fromJson(Map<String, dynamic> json) => ConversionModel(
        rates: Map.from(json["rates"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        base: json["base"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "base": base,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    };
}
