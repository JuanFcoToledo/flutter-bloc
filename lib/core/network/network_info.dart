abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    // Aquí podrías usar connectivity_plus para verificar la conexión
    // Por ahora retornamos true como placeholder
    return true;
  }
}
