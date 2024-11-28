import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ConnectionCubit extends Cubit<ConnectionStatus> {
  ConnectionCubit() : super(ConnectionStatus.connected);

  final Connectivity _connectivity = Connectivity();

  Future<void> init() async {
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    emit(_getConnectivityStatus(result[0]));
  }

  ConnectionStatus _getConnectivityStatus(ConnectivityResult result) {
    switch (result) {
    case ConnectivityResult.wifi:
    case ConnectivityResult.mobile:
    return ConnectionStatus.connected;
    case ConnectivityResult.none:
    default:
    return ConnectionStatus.disconnected;
    }
  }

  @override
  Future<void> close() {
    _connectivity.onConnectivityChanged.drain();
    return super.close();
  }
}
enum ConnectionStatus { connected, disconnected }
