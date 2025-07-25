import 'package:connectivity_plus/connectivity_plus.dart';
import '../core/network/api_client.dart';
import '../core/network/network_info.dart';

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  factory ServiceLocator() => _instance;
  ServiceLocator._internal();

  static ServiceLocator get instance => _instance;

  // Core
  late ApiClient _apiClient;
  late NetworkInfo _networkInfo;

  void init() {
    // Core
    _apiClient = ApiClient();
    _networkInfo = NetworkInfoImpl(Connectivity());
  }

  // Getters
  ApiClient get apiClient => _apiClient;
  NetworkInfo get networkInfo => _networkInfo;
}
