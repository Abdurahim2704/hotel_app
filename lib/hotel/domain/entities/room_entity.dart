final data = {
  "id": 1,
  "name": "Стандартный номер с видом на бассейн",
  "price": 186600,
  "price_per": "За 7 ночей с перелетом",
  "peculiarities": ["Включен только завтрак", "Кондиционер"],
  "image_urls": [
    "https://www.atorus.ru/sites/default/files/upload/image/News/56871/%D1%80%D0%B8%D0%BA%D1%81%D0%BE%D1%81%20%D1%81%D0%B8%D0%B3%D0%B5%D0%B9%D1%82.jpg",
    "https://q.bstatic.com/xdata/images/hotel/max1024x768/267647265.jpg?k=c8233ff42c39f9bac99e703900a866dfbad8bcdd6740ba4e594659564e67f191&o=",
    "https://worlds-trip.ru/wp-content/uploads/2022/10/white-hills-resort-5.jpeg"
  ]
};

class RoomEntity {
  final int id;
  final String name;
  final num price;
  final String pricePer;
  final List<String> peculiarities;
  final List<String> imageUrls;

  RoomEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });
}
