import 'package:hotel_app/hotel/data/models/models.dart';
import 'package:hotel_app/hotel/domain/entities/entities.dart';

class Hotel extends HotelEntity {
  Hotel({
    required super.id,
    required super.name,
    required super.adress,
    required super.minimalPrice,
    required super.priceForIt,
    required super.rating,
    required super.ratingName,
    required super.imageUrls,
    required super.aboutTheHotel,
  });

  factory Hotel.fromJson(Map<String, Object?> json) {
    final id = json["id"] as int;
    final name = json["name"] as String;
    final adress = json["adress"] as String;
    final minimalPrice = json["minimal_price"] as int;
    final priceForIt = json["price_for_it"] as String;
    final rating = json["rating"] as num;
    final ratingName = json["rating_name"] as String;
    final imageUrls =
        (json["image_urls"] as List).map((e) => e as String).toList();
    final data = json["about_the_hotel"] as Map<String, Object?>;
    final aboutTheHotel = AboutHotel.fromJson(data);
    return Hotel(
        id: id,
        name: name,
        adress: adress,
        minimalPrice: minimalPrice,
        priceForIt: priceForIt,
        rating: rating,
        ratingName: ratingName,
        imageUrls: imageUrls,
        aboutTheHotel: aboutTheHotel);
  }
}
