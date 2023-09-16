import 'package:hotel_app/hotel/domain/entities/about_hotel.dart';

class HotelEntity {
  final int id;
  final String name;
  final String adress;
  final int minimalPrice;
  final String priceForIt;
  final num rating;
  final String ratingName;
  final List<String> imageUrls;
  final AboutHotelEntity aboutTheHotel;

  HotelEntity({
    required this.id,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });
}
