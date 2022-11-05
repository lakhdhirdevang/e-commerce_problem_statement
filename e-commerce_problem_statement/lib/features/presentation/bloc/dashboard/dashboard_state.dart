part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class AppliedFilter extends DashboardState{
  final int index;

  AppliedFilter(this.index);
}

class ProductLikeDisLikeState extends DashboardState{
  final bool isLikeDisLike;

  ProductLikeDisLikeState(this.isLikeDisLike);
}
