import 'package:dio/dio.dart';
import 'package:hotel_app/hotel/data/models/room_model.dart';
import 'package:retrofit/http.dart';

import '../../../../config/apis.dart';

part 'room_api_service.g.dart';

@RestApi(baseUrl: Apis.baseUrl + Apis.roomApi)
abstract class RoomApiService {

  factory RoomApiService(Dio dio) = _RoomApiService;

  @GET("")
  Future<List<Room>> getRooms();
}
