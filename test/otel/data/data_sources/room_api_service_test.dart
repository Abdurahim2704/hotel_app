import 'package:dio/dio.dart';
import 'package:hotel_app/hotel/data/data_sources/room_api_service/room_api_service.dart';
import 'package:hotel_app/hotel/data/models/room_model.dart';
import 'package:test/test.dart';

void main() {
  group("Room Api Tesr", () {
    test("getRooms should return List<Room>", () async {
      final data = await RoomApiService(Dio()).getRooms();
      print(data.length);
      expect(data, const TypeMatcher<List<Room>>());
    });
  });
}
