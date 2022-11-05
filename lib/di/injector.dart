import 'package:get_it/get_it.dart';
import 'package:untitled/features/presentation/bloc/cart/cart_bloc.dart';

import '../features/presentation/bloc/dashboard/dashboard_bloc.dart';

GetIt sl = GetIt.instance;

Future setup() async {
  sl.registerFactory(() => DashboardBloc());
  sl.registerFactory(() => CartBloc());
}
