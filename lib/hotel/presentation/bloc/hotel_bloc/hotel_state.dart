part of 'hotel_bloc.dart';

@immutable
abstract class HotelState {
  final Hotel? hotel;

  const HotelState({required this.hotel});
}

class HotelInitial extends HotelState {
  const HotelInitial({super.hotel});
}

class HotelLoading extends HotelState {
  const HotelLoading({super.hotel});
}

class HotelFetchedSucceeded extends HotelState {
  const HotelFetchedSucceeded({super.hotel});
}

class HotelFetchedFailed extends HotelState {
  const HotelFetchedFailed({super.hotel});
}
