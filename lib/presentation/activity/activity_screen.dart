import 'package:flutter/material.dart';
import 'package:share_way_frontend/core/widgets/bottom_navigation/bottom_navigation.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavigation(initialIndex: 1),
      body: Center(
        child: Text(
          'Activity Screen',
        ),
      ),
    );
  }
}
