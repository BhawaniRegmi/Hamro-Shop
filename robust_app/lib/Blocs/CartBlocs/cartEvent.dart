import 'package:equatable/equatable.dart';
import 'cartBloc.dart';
//import 'cart_item.dart'; // CartItem model

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// class AddToCartEvent extends CartEvent {
//   final CartItem item;

//   AddToCartEvent(this.item);

//   @override
//   List<Object?> get props => [item];
// }

class AddToCartEvent extends CartEvent {
  final CartItem item;

  AddToCartEvent(this.item);
}

class RemoveFromCartEvent extends CartEvent {
  final CartItem item;
  RemoveFromCartEvent(this.item);
}

class UpdateCartItemQuantityEvent extends CartEvent {
  final CartItem item;
  final int newQuantity;
  UpdateCartItemQuantityEvent(this.item, this.newQuantity);
}


