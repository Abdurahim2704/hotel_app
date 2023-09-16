import 'package:hotel_app/hotel/domain/entities/entities.dart';

class AboutHotel extends AboutHotelEntity {
  AboutHotel({required super.description, required super.peculiarities});

  factory AboutHotel.fromJson(Map<String, Object?> json) {
    final description = json["description"] as String;
    final peculiarities =
        (json["peculiarities"] as List).map((e) => e as String).toList();

    return AboutHotel(description: description, peculiarities: peculiarities);
  }
}
