import 'package:hotel_app/hotel/domain/entities/entities.dart';

abstract class HotelRepository {
  Future<HotelEntity> getHotelData();
}
