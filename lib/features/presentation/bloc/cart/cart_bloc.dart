import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/features/data/models/cart_list_data_model.dart';

import '../../../data/models/item_list_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<CartListDataModel>? cartList = [];
  CartBloc({this.cartList}) : super(CartInitial()) {
    on<CartEvent>((event, emit) {});
    on<ProductAddInCartEvent>(_addProduct);
    on<ProductRemoveInCartEvent>(_removeProduct);
  }

  void _addProduct(ProductAddInCartEvent event, emit) {
    emit(ProductAdded(count: event.count, itemListData: event.itemListData));
  }

  void _removeProduct(ProductRemoveInCartEvent event, emit) {
    emit(ProductRemoved(count: event.count, itemListData: event.itemListData));
  }
}
