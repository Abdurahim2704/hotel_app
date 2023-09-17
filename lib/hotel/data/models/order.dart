import 'package:hotel_app/hotel/domain/entities/entities.dart';

final data = {
  "id": 1,
  "hotel_name": "Лучший пятизвездочный отель в Хургаде, Египет",
  "hotel_adress": "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
  "horating": 5,
  "rating_name": "Превосходно",
  "departure": "Москва",
  "arrival_country": "Египет, Хургада",
  "tour_date_start": "19.09.2023",
  "tour_date_stop": "27.09.2023",
  "number_of_nights": 7,
  "room": "Люкс номер с видом на море",
  "nutrition": "Все включено",
  "tour_price": 289400,
  "fuel_charge": 9300,
  "service_charge": 2150
};

class Order extends OrderEntity {
  Order({
    required super.id,
    required super.hotelName,
    required super.hotelAdress,
    required super.horating,
    required super.ratingName,
    required super.departure,
    required super.arrivalCountry,
    required super.tourDateStart,
    required super.tourDateStop,
    required super.numberOfNights,
    required super.room,
    required super.nutrition,
    required super.tourPrice,
    required super.fuelCharge,
    required super.serviceCharge,
  });

  factory Order.fromJson(Map<String, Object?> json) {
    final id = json["id"] as int;
    final hotelName = json["hotel_name"] as String;
    final hotelAdress = json["hotel_adress"] as String;
    final horating = json["horating"] as num;
    final ratingName = json["rating_name"] as String;
    final departure = json["departure"] as String;
    final arrivalCountry = json["arrival_country"] as String;
    final tourDateStart = json["tour_date_start"] as String;
    final tourDateStop = json["tour_date_stop"] as String;
    final numberOfNights = json["number_of_nights"] as int;
    final room = json["room"] as String;
    final nutrition = json["nutrition"] as String;
    final tourPrice = json["tour_price"] as int;
    final fuelCharge = json["fuel_charge"] as int;
    final serviceCharge = json["service_charge"] as int;

    return Order(
      id: id,
      hotelName: hotelName,
      hotelAdress: hotelAdress,
      horating: horating,
      ratingName: ratingName,
      departure: departure,
      arrivalCountry: arrivalCountry,
      tourDateStart: tourDateStart,
      tourDateStop: tourDateStop,
      numberOfNights: numberOfNights,
      room: room,
      nutrition: nutrition,
      tourPrice: tourPrice,
      fuelCharge: fuelCharge,
      serviceCharge: serviceCharge,
    );
  }

  num get total => tourPrice + fuelCharge + serviceCharge;
}
