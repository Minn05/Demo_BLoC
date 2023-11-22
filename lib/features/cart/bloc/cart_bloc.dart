import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demobloc/features/home/models/home_product_model.dart';
import 'package:meta/meta.dart';

import '../../../data/cart_items.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  //get your cartItems
  //check your product model in the cart - if true
  //remove your cart from cartItems
  //emit CartRemoceState

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productModel);
    emit(CartSuccessState(cartItems: cartItems));
  }
}
