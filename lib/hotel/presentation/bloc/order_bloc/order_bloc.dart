import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hotel_app/hotel/data/data_sources/order_api_service/order_api_service.dart';
import 'package:hotel_app/hotel/data/models/models.dart';
import 'package:meta/meta.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(const OrderInitial()) {
    on<GetOrderEvent>(_getOrderEvent);
    on<OrderValidEvent>(_orderValid);
    on<OrderInvalidEvent>(_orderInvalid);
  }

  void _getOrderEvent(GetOrderEvent event, Emitter emit) async {
    emit(OrderLoading(order: state.order, status: ValidationStatus.valid));
    final order = await OrderApiService(Dio()).getOrderInformation();
    emit(OrderFetchedSucceeded(order: order, status: ValidationStatus.valid));
  }

  void _orderInvalid(OrderInvalidEvent event, Emitter emit) {
    emit(OrderValidation(status: ValidationStatus.invalid, order: state.order));
  }

  void _orderValid(OrderValidEvent event, Emitter emit) {
    emit(OrderValidation(status: ValidationStatus.valid, order: state.order));
  }
}
