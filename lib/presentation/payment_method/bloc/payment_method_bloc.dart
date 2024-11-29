import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/map/input/create_hitch_ride_input.dart';
import 'package:share_way_frontend/domain/map/map_repository.dart';
import 'package:share_way_frontend/presentation/payment_method/bloc/payment_method_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class PaymentMethodBloc extends Cubit<PaymentMethodState> {
  PaymentMethodBloc() : super(PaymentMethodState());

  void onStart(){}
}
