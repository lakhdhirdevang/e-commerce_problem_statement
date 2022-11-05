part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class ProductAdded extends CartState{
  final int? count;
  final ItemListData? itemListData;

  ProductAdded({this.count, this.itemListData});

}

class ProductRemoved extends CartState{
  final int? count;
  final ItemListData? itemListData;

  ProductRemoved({this.count, this.itemListData});

}