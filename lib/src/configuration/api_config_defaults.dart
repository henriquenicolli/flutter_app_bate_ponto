class ApiConfig {
  static const String _basePath = 'https://api.example.com/';
  static const String _testPath = 'http://10.0.2.2:10000/';
  //static const String _testPath = 'http://localhost:10000/';
  //static const String _testPath = 'http://192.168.5.8:10000/';
  static bool isTestMode = true;

  static const String _registrarPontoPathPOST = 'v1/rep/registroPonto/salvar';
  static const String _atualizarPontoPathPATCH = 'v1/rep/registroPonto/atualizar';
  static const String _registroPontoSnapshotGET = 'v1/rep/registroPonto/snapshot';
  static const String _registrosPontoMesGET = 'v1/rep/registroPonto';
  static const String _registrosPontoMesDELETE = 'v1/rep/registroPonto/deletar';
  static const String _horaAtualGET = 'v1/rep/horaAtual';
  static const String _token = 'v1/rep/authenticate';

  static String get _apiUrl {
    if (isTestMode) {
      return _testPath;
    } else {
      return _basePath;
    }
  }

  static String get postRegistrarPontoPath {
    return _apiUrl + _registrarPontoPathPOST;
  }

  static String get getRegistroPontoSnapshot {
    return _apiUrl + _registroPontoSnapshotGET;
  }

  static String get getRegistroPontoMes {
    return _apiUrl + _registrosPontoMesGET;
  }

  static String get patchAtualizarPontoPath {
    return _apiUrl + _atualizarPontoPathPATCH;
  }

  static String get deleteRegistroPontoPath {
    return _apiUrl + _registrosPontoMesDELETE;
  }

  static String get getHoraAtualPath {
    return _apiUrl + _horaAtualGET;
  }

  static String get getNewToken {
    return _apiUrl + _token;
  }
}
