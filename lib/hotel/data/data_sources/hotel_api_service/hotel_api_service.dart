import 'package:dio/dio.dart';
import 'package:hotel_app/config/apis.dart';
import 'package:hotel_app/hotel/data/models/models.dart';
import 'package:retrofit/http.dart';

part 'hotel_api_service.g.dart';

@RestApi(baseUrl: Apis.baseUrl + Apis.hotelApi)
abstract class HotelApiService {
  factory HotelApiService(Dio dio) = _HotelApiService;

  @GET("")
  Future<Hotel> getHotelInformation();
}
