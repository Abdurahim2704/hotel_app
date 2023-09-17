import 'package:dio/dio.dart';
import 'package:hotel_app/config/apis.dart';
import 'package:retrofit/http.dart';

import '../../models/models.dart';

part 'order_api_service.g.dart';

@RestApi(baseUrl: Apis.baseUrl + Apis.orderApi)
abstract class OrderApiService {
  factory OrderApiService(Dio dio) = _OrderApiService;

  @GET("")
  Future<Order> getOrderInformation();
}
