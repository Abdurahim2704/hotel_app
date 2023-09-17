import 'package:hotel_app/hotel/data/models/order.dart';
import 'package:hotel_app/hotel/domain/entities/entities.dart';
import 'package:test/test.dart';

final mockData = {
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

void main() {
  group("Order model test", () {
    test("Order model with mock data", () {
      final hotel = Order.fromJson(mockData);
      expect(hotel, const TypeMatcher<Order>());
    });
    test("Order entity with mock data", () {
      final hotel = Order.fromJson(mockData);
      expect(hotel, const TypeMatcher<OrderEntity>());
    });
  });
}
