import 'package:hotel_app/hotel/data/models/hotel_model.dart';
import 'package:hotel_app/hotel/domain/entities/entities.dart';
import 'package:test/test.dart';

final mockData = {
  "id": 1,
  "name": "Лучший пятизвездочный отель в Хургаде, Египет",
  "adress": "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
  "minimal_price": 134268,
  "price_for_it": "За тур с перелётом",
  "rating": 5,
  "rating_name": "Превосходно",
  "image_urls": [
    "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg",
    "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg",
    "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"
  ],
  "about_the_hotel": {
    "description":
        "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!",
    "peculiarities": [
      "Бесплатный Wifi на всей территории отеля",
      "1 км до пляжа",
      "Бесплатный фитнес-клуб",
      "20 км до аэропорта"
    ]
  }
};

void main() {
  group("Hotel model test", () {
    test("Hotel model with mock data", () {
      final hotel = Hotel.fromJson(mockData);
      expect(hotel, const TypeMatcher<Hotel>());
    });
    test("Hotel entity with mock data", () {
      final hotel = Hotel.fromJson(mockData);
      expect(hotel, const TypeMatcher<HotelEntity>());
    });
  });
}
