import 'package:dio/dio.dart';
import 'package:hotel_app/hotel/data/models/models.dart';

import '../../../../config/apis.dart';

class RoomApiService {
  static Future<List<Room>> getRooms() async {
    final dio = Dio();

    final response = await dio.get(Apis.baseUrl + Apis.roomApi);
    if (response.statusCode == 200) {
      final jsonRooms =
          (response.data as Map<String, Object?>)["rooms"] as List;
      final rooms = jsonRooms
          .map((e) => Room.fromJson(e as Map<String, Object?>))
          .toList();
      return rooms;
    }

    return [];
  }
}
