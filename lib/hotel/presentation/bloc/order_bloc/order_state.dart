part of 'order_bloc.dart';

@immutable
abstract class OrderState {
  final ValidationStatus? status;
  final Order? order;

  const OrderState({this.order, this.status});
}

class OrderInitial extends OrderState {
  const OrderInitial({super.order, super.status});
}

class OrderLoading extends OrderState {
  const OrderLoading({super.order, super.status});
}

class OrderFetchedSucceeded extends OrderState {
  const OrderFetchedSucceeded({super.order, super.status});
}

class OrderFetchedFailed extends OrderState {
  const OrderFetchedFailed({super.order, super.status});
}

class OrderValidation extends OrderState {
  const OrderValidation({super.status, super.order});
}
