part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class ProductAddInCartEvent extends CartEvent{
  final int? count;
  final ItemListData? itemListData;

  ProductAddInCartEvent({this.count, this.itemListData});
}

class ProductRemoveInCartEvent extends CartEvent{
  final int? count;
  final ItemListData? itemListData;

  ProductRemoveInCartEvent({this.count, this.itemListData});
}


