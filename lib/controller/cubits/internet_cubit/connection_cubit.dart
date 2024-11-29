import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionCubit extends Cubit<ConnectionStatus> {
  final Connectivity _connectivity;

  ConnectionCubit(this._connectivity) : super(ConnectionStatus.connected) {
    _monitorConnectivity();
  }

  void _monitorConnectivity() {
    _connectivity.onConnectivityChanged.listen(
      (result) {
        switch (result[0]) {
          case ConnectivityResult.wifi:
          case ConnectivityResult.mobile:
            emit(ConnectionStatus.connected);
            break;
          case ConnectivityResult.none:
          default:
            emit(ConnectionStatus.disconnected);
            break;
        }
      },
    );
  }

  @override
  Future<void> close() {
    _connectivity.onConnectivityChanged.drain();
    return super.close();
  }
}

enum ConnectionStatus { connected, disconnected }
