import 'package:bloc/bloc.dart';
import 'package:hotel_app/hotel/data/data_sources/room_api_service/room_api_service.dart';
import 'package:hotel_app/hotel/data/models/models.dart';
import 'package:meta/meta.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  RoomBloc() : super(const RoomInitial(rooms: [])) {
    on<GetRoomEvent>(_getRoomEvent);
  }

  void _getRoomEvent(GetRoomEvent event, Emitter emit) async {
    emit(RoomLoading(rooms: state.rooms));
    final rooms = await RoomApiService.getRooms();
    emit(RoomFetchedSucceeded(rooms: rooms));
  }
}
