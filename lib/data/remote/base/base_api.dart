import 'package:demo_notification/core/network/index.dart';
import 'package:demo_notification/data/net/index.dart';
import 'package:demo_notification/data/remote/api/index.dart';
import 'package:demo_notification/main/app_injector.dart';

import 'index.dart';

abstract class BaseApi {
  NetworkStatus? networkStatus;
  EndPointProvider? endPointProvider;
  RequestHeaderBuilder? headerBuilder;
  ApiConfig? apiConfig;

  BaseApi({
    ApiConfig? config,
    EndPointProvider? provider,
    NetworkStatus? status,
    RequestHeaderBuilder? builder,
  }) {
    networkStatus = status ?? injector.get<NetworkStatus>();
    headerBuilder = builder ?? injector.get<RequestHeaderBuilder>();
    endPointProvider = provider ?? injector.get<EndPointProvider>();
    apiConfig = config ?? injector.get<ApiConfig>();
  }

  Future<ApiConnection> initConnection() async {
    final header = await headerBuilder?.buildHeader();
    return ApiConnection(
      apiConfig!,
      header ?? {},
      networkStatus: networkStatus,
    );
  }
}
