import 'package:flutter_bloc/flutter_bloc.dart';
import 'cartEvent.dart';
import 'cartState.dart';


// class CartBloc extends Bloc<CartEvent, CartState> {
//   CartBloc() : super(CartState.initial()) {
//     on<AddToCartEvent>((event, emit) {
//       final updatedItems = List.from(state.items)..add(event.item);
//       emit(CartState(items: updatedItems, itemCount: updatedItems.length));
//     });
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'cartEvent.dart';
import 'cartState.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState.initial()) {
    // Handle Add to Cart
    on<AddToCartEvent>((event, emit) {
      final updatedItems = List.from(state.items)..add(event.item);
      emit(CartState(items: updatedItems, itemCount: updatedItems.length));
    });

    // Handle Remove from Cart
    on<RemoveFromCartEvent>((event, emit) {
      final updatedItems = state.items.where((item) => item != event.item).toList();
      emit(CartState(items: updatedItems, itemCount: updatedItems.length));
    });
  }
}



// class CartItem {
//   final String name;
//   final String color;
//   final String size;
//   final int quantity;
//   final int price;
//   final String imagePath;

//   CartItem({
//     required this.name,
//     required this.color,
//     required this.size,
//     required this.quantity,
//     required this.price,
//     required this.imagePath,
//   });

//   @override
//   String toString() {
//     return 'CartItem(name: $name, color: $color, size: $size, quantity: $quantity, price: $price)';
//   }
// }







class CartItem {
  final String name;
  final String color;
  final String size;
  final int quantity;
  final int price;
  final String imagePath;

  CartItem({
    required this.name,
    required this.color,
    required this.size,
    required this.quantity,
    required this.price,
    required this.imagePath,
  });

  CartItem copyWith({
    String? name,
    String? color,
    String? size,
    int? quantity,
    int? price,
    String? imagePath,
  }) {
    return CartItem(
      name: name ?? this.name,
      color: color ?? this.color,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
