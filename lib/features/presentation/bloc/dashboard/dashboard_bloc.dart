import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/features/data/models/filter_list_data.dart';
import 'package:untitled/features/data/models/item_list_data_model.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) {});
    on<SelectUnselectFilterTagEvent>(_applyFilter);
    on<ProductLikeDislikeEvent>(_productLikeDisLike);
  }

  void _applyFilter(SelectUnselectFilterTagEvent event, emit) {
    for (var element in event.listOfFilterData) {
      element.isSelected = false;
    }
    event.filterListData.isSelected = true;
    emit(AppliedFilter(event.index));
  }

  void _productLikeDisLike(ProductLikeDislikeEvent event, emit) {
    bool isLikeDisLike = event.itemListData?.isLike??false;
    print('-----${event.itemListData?.isLike}');
    isLikeDisLike = !isLikeDisLike;
    event.itemListData?.isLike = isLikeDisLike;
    emit(ProductLikeDisLikeState(isLikeDisLike));
  }
}
