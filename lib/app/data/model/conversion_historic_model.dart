import 'dart:convert';

class HistoricConversionModel {
  final String resultado;
  final String moedaBase;
  final String moedaDesejada;
  final DateTime date;
  final double valor_base;
  final double valor_desejado;

  HistoricConversionModel({
    this.resultado,
    this.moedaBase,
    this.moedaDesejada,
    this.date,
    this.valor_base,
    this.valor_desejado,
  });

  HistoricConversionModel copyWith({
    String resultado,
    String moedaBase,
    String moedaDesejada,
    DateTime date,
    double valor_base,
    double valor_desejado,
  }) {
    return HistoricConversionModel(
      resultado: resultado ?? this.resultado,
      moedaBase: moedaBase ?? this.moedaBase,
      moedaDesejada: moedaDesejada ?? this.moedaDesejada,
      date: date ?? this.date,
      valor_base: valor_base ?? this.valor_base,
      valor_desejado: valor_desejado ?? this.valor_desejado,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'resultado': resultado,
      'moedaBase': moedaBase,
      'moedaDesejada': moedaDesejada,
      'date': date?.millisecondsSinceEpoch,
      'valor_base': valor_base,
      'valor_desejado': valor_desejado,
    };
  }

  factory HistoricConversionModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return HistoricConversionModel(
      resultado: map['resultado'],
      moedaBase: map['moedaBase'],
      moedaDesejada: map['moedaDesejada'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      valor_base: map['valor_base'],
      valor_desejado: map['valor_desejado'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoricConversionModel.fromJson(String source) =>
      HistoricConversionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HistoricConversionModel(resultado: $resultado, moedaBase: $moedaBase, moedaDesejada: $moedaDesejada, date: $date, valor_base: $valor_base, valor_desejado: $valor_desejado)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is HistoricConversionModel &&
        o.resultado == resultado &&
        o.moedaBase == moedaBase &&
        o.moedaDesejada == moedaDesejada &&
        o.date == date &&
        o.valor_base == valor_base &&
        o.valor_desejado == valor_desejado;
  }

  @override
  int get hashCode {
    return resultado.hashCode ^
        moedaBase.hashCode ^
        moedaDesejada.hashCode ^
        date.hashCode ^
        valor_base.hashCode ^
        valor_desejado.hashCode;
  }
}
