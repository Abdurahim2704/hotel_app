part of 'room_bloc.dart';

@immutable
abstract class RoomState {
  final List<Room> rooms;

  const RoomState({required this.rooms});
}

class RoomInitial extends RoomState {
  const RoomInitial({required super.rooms});
}

class RoomLoading extends RoomState {
  const RoomLoading({required super.rooms});
}

class RoomFetchedSucceeded extends RoomState {
  const RoomFetchedSucceeded({required super.rooms});
}

class RoomFetchedFailed extends RoomState {
  const RoomFetchedFailed({required super.rooms});
}
