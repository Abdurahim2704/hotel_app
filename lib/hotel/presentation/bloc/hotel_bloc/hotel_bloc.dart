import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hotel_app/hotel/data/data_sources/hotel_api_service/hotel_api_service.dart';
import 'package:meta/meta.dart';

import '../../../data/models/models.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelBloc() : super(const HotelInitial()) {
    on<GetHotelEvent>(_getHotelEvent);
  }

  void _getHotelEvent(GetHotelEvent event, Emitter emit) async {
    emit(HotelLoading(hotel: state.hotel));
    final hotel = await HotelApiService(Dio()).getHotelInformation();
    emit(HotelFetchedSucceeded(hotel: hotel));
  }
}
