import 'package:flutter_bloc/flutter_bloc.dart';
import 'cartEvent.dart';
import 'cartState.dart';
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

        // Handle Update Cart Item Quantity
    on<UpdateCartItemQuantityEvent>((event, emit) {
      final updatedItems = state.items.map((item) {
        if (item == event.item) {
          return item.copyWith(quantity: event.newQuantity);
        }
        return item;
      }).toList();
      emit(CartState(items: updatedItems, itemCount: updatedItems.length));
    });
  }
}






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
