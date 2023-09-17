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
