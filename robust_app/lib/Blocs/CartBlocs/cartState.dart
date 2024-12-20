import 'package:equatable/equatable.dart';
import 'cartBloc.dart';
//import 'cart_item.dart'; // CartItem model

class CartState extends Equatable {
  // final List<CartItem> items;
  final List<dynamic> items;
  late final int itemCount;

  CartState({required this.items, required this.itemCount});

  factory CartState.initial() {
    return CartState(items: [], itemCount: 0);
  }

  @override
  List<Object?> get props => [items, itemCount];
}


