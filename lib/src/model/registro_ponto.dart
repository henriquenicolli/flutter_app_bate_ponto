import 'package:flutter/material.dart';
import 'package:flutter_app_bate_ponto/src/model/enums/tipo_marcacao.dart';

class RegistroPonto {
  int numSeqRegistro;
  int numSeqEsRegistro;
  DateTime dataMarcacaoPonto;
  TimeOfDay horaMarcacaoPonto;
  String fusoHorarioMarcacao;
  String fusoHorarioRegistro;
  bool marcacaoOnline;
  String cpfFuncionario;
  double latitude;
  double longitude;
  String motivoMarcacao;
  int coletorRegistro;
  String tipoMarcacao;
  String fonteMarcacao;
  String empregado;
  bool registroAlterado;
  bool registroAlteradoAprovacao;
  bool registroExcluido;
  bool registroExcluidoAprovacao;

  RegistroPonto({
    required this.numSeqRegistro,
    required this.numSeqEsRegistro,
    required this.dataMarcacaoPonto,
    required this.horaMarcacaoPonto,
    required this.fusoHorarioMarcacao,
    required this.fusoHorarioRegistro,
    required this.marcacaoOnline,
    required this.cpfFuncionario,
    required this.latitude,
    required this.longitude,
    required this.motivoMarcacao,
    required this.coletorRegistro,
    required this.tipoMarcacao,
    required this.fonteMarcacao,
    required this.empregado,
    required this.registroAlterado,
    required this.registroAlteradoAprovacao,
    required this.registroExcluido,
    required this.registroExcluidoAprovacao
  });

  factory RegistroPonto.fromJson(Map<String, dynamic> json) {
    TimeOfDay parseTimeOfDay(String timeString) {
      final parts = timeString.split(':');
      return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
    }

    if (json['dataMarcacaoPonto'] is String) {
      return RegistroPonto(
        numSeqRegistro: json['numSeqRegistro'],
        numSeqEsRegistro: json['numSeqEsRegistro'],
        dataMarcacaoPonto: DateTime.parse(json['dataMarcacaoPonto']),
        horaMarcacaoPonto: parseTimeOfDay(json['horaMarcacaoPonto']),
        fusoHorarioMarcacao: json['fusoHorarioMarcacao'],
        fusoHorarioRegistro: json['fusoHorarioRegistro'],
        marcacaoOnline: json['marcacaoOnline'],
        cpfFuncionario: json['cpfFuncionario'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        motivoMarcacao: json['motivoMarcacao'],
        coletorRegistro: json['coletorRegistro'],
        tipoMarcacao: json['tipoMarcacao'],
        fonteMarcacao: json['fonteMarcacao'],
        empregado: json['empregado'],
        registroAlterado: json['registroAlterado'] ?? false,
        registroAlteradoAprovacao: json['registroAlteradoAprovacao'] ?? false,
        registroExcluido: json['excluido'] ?? false,
        registroExcluidoAprovacao: json['registroExcluidoAprovacao'] ?? false
      );
    } else {
      throw const FormatException('Failed to parse registro ponto');
    }
  }

  String get horaFormatada {
    return '${horaMarcacaoPonto.hour.toString().padLeft(2, '0')}:${horaMarcacaoPonto.minute.toString().padLeft(2, '0')}';
  }

  String get getTipoMarcacao {
    return tipoMarcacao == 'E' ? 'Entrada' : 'Saída';
  }

  set setDataMarcacaoPonto(DateTime newDataMarcacaoPonto) {
    this.dataMarcacaoPonto = newDataMarcacaoPonto;
  }

  set setHoraMarcacaoPonto(TimeOfDay newHoraMarcacaoPonto) {
    this.horaMarcacaoPonto = newHoraMarcacaoPonto;
  }

  set setTipoMarcacao(String newTipoMarcacao) {
    TipoMarcacao tipoRegistro = newTipoMarcacao == 'Entrada' ? TipoMarcacao.ENTRADA : TipoMarcacao.SAIDA;
    this.tipoMarcacao = tipoRegistro.codigo;
  }
}
