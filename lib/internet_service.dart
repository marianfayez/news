import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class InternetService {
  InternetService._internal();
  static final InternetService _instance = InternetService._internal();
  factory InternetService() => _instance;

  final StreamController<bool> _connectionStreamController =
      StreamController.broadcast();

  Stream<bool> get connectionStream => _connectionStreamController.stream;

  final Connectivity _connectivity = Connectivity();

  Future<bool> checkConnection() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    return _updateConnectivityResult(connectivityResult);
  }

  bool _updateConnectivityResult(List<ConnectivityResult> result) {
    bool isConnected = true;
    for (var data in result) {
      if (data == ConnectivityResult.none) {
        isConnected = false;
      }
    }
    _connectionStreamController.add(isConnected);
    return isConnected;
  }

  void init() {
    _connectivity.onConnectivityChanged.listen((event) {
      _updateConnectivityResult(event);
    });
  }

  void dispose() {
    _connectionStreamController.close();
  }
}
