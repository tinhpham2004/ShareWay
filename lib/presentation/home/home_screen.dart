import 'package:flutter/material.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';

class HomeScreen extends StatelessWidget {
  final AppUser user;
  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              '${user.email}',
            ),
            Text(
              '${user.fullName}',
            ),
            Text(
              '${user.phoneNumber}',
            ),
            Text(
              '${user.id}',
            ),
            Text(
              '${user.createdAt}',
            ),
            Text(
              '${user.updatedAt}',
            ),
          ],
        ),
      ),
    );
  }
}
