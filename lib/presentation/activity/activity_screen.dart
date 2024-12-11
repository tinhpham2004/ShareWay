import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/widgets/appbar/appbar.dart';
import 'package:share_way_frontend/core/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_widget.dart';
import 'package:share_way_frontend/presentation/activity/bloc/activity_bloc.dart';
import 'package:share_way_frontend/presentation/activity/bloc/activity_state.dart';
import 'package:share_way_frontend/presentation/activity/widgets/ride_field.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  late ActivityBloc bloc;

  @override
  void initState() {
    bloc = ActivityBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(context: context),
      child: BlocBuilder<ActivityBloc, ActivityState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColor.white,
            appBar: Appbar(title: 'Hoạt động'),
            bottomNavigationBar: const BottomNavigation(initialIndex: 1),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      key: ObjectKey(state.dataChange),
                      children: [
                        _buildActivity(),
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

  Widget _buildActivity() {
    return BlocBuilder<ActivityBloc, ActivityState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: LoadingWidget());
        }
        return const RideField();
      },
    );
  }
}
