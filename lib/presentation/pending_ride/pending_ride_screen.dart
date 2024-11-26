import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/widgets/appbar/appbar.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_widget.dart';
import 'package:share_way_frontend/presentation/pending_ride/bloc/pending_ride_bloc.dart';
import 'package:share_way_frontend/presentation/pending_ride/bloc/pending_ride_state.dart';
import 'package:share_way_frontend/presentation/pending_ride/widgets/filter_button_field.dart';
import 'package:share_way_frontend/presentation/pending_ride/widgets/pending_hitch_ride_field.dart';
import 'package:share_way_frontend/presentation/pending_ride/widgets/pending_give_ride_field.dart';

class PendingRideScreen extends StatefulWidget {
  const PendingRideScreen({super.key});

  @override
  State<PendingRideScreen> createState() => _PendingRideScreenState();
}

class _PendingRideScreenState extends State<PendingRideScreen> {
  late PendingRideBloc bloc;

  @override
  void initState() {
    bloc = PendingRideBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(context: context),
      child: BlocBuilder<PendingRideBloc, PendingRideState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColor.white,
            appBar: Appbar(title: 'Chuyến đi vừa tạo'),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      key: ObjectKey(state.dataChange),
                      children: [
                        const FilterButtonField(),
                        _buildPendingRide(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPendingRide() {
    return BlocBuilder<PendingRideBloc, PendingRideState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: LoadingWidget());
        }
        return state.selectedButtonIndex == 0
            ? const PendingGiveRideField()
            : const PendingHitchRideField();
      },
    );
  }
}
