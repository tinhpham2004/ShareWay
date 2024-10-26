import 'package:flutter/material.dart';
import 'package:share_way_frontend/core/widgets/bottom_navigation/bottom_navigation.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavigation(initialIndex: 3),
      body: Center(
        child: Text(
          'Account Screen',
        ),
      ),
    );
  }
}
