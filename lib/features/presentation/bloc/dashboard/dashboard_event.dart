part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class SelectUnselectFilterTagEvent extends DashboardEvent{
  final FilterListData filterListData;
  final List<FilterListData> listOfFilterData;
  final int index;

  SelectUnselectFilterTagEvent(this.filterListData, this.listOfFilterData,this.index);
}

class ProductLikeDislikeEvent extends DashboardEvent{
  final ItemListData? itemListData;

  ProductLikeDislikeEvent({this.itemListData});

}
