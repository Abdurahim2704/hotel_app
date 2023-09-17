part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}

class GetOrderEvent extends OrderEvent {}

class OrderInvalidEvent extends OrderEvent {}

class OrderValidEvent extends OrderEvent {}
