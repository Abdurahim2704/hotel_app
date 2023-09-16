import 'package:hotel_app/hotel/domain/entities/entities.dart';

class Room extends RoomEntity {
  Room({
    required super.id,
    required super.name,
    required super.price,
    required super.pricePer,
    required super.peculiarities,
    required super.imageUrls,
  });

  factory Room.fromJson(Map<String, Object?> json) {
    final id = json["id"] as int;
    final name = json["name"] as String;
    final price = json["price"] as num;
    final pricePer = json["price_per"] as String;
    final peculiarities =
        (json["peculiarities"] as List).map((e) => e as String).toList();
    final imageUrls =
        (json["image_urls"] as List).map((e) => e as String).toList();

    return Room(
      id: id,
      name: name,
      price: price,
      pricePer: pricePer,
      peculiarities: peculiarities,
      imageUrls: imageUrls,
    );
  }
}
