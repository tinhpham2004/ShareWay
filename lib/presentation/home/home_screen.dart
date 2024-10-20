import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/auth/auth_repository.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';
import 'package:share_way_frontend/router/app_path.dart';

class HomeScreen extends StatefulWidget {
  final AppUser user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? accessToken;
  String? refreshToken;

  void getToken() async {
    final accessToken = await Preferences.getAccessToken();
    final refreshToken = await Preferences.getRefreshToken();
    setState(() {
      this.accessToken = accessToken!;
      this.refreshToken = refreshToken!;
    });
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'email: ${widget.user.email}',
            ),
            Text(
              'name: ${widget.user.fullName}',
            ),
            Text(
              'phone number: ${widget.user.phoneNumber}',
            ),
            Text(
              'user ID: ${widget.user.id}',
            ),
            Text(
              'created at: ${widget.user.createdAt}',
            ),
            Text(
              'updated at: ${widget.user.updatedAt}',
            ),
            Text(
              'access token: $accessToken',
            ),
            Text(
              'refresh token: $refreshToken',
            ),
            IconButton(
                color: AppColor.error,
                padding: EdgeInsets.all(8.0),
                onPressed: () async {
                  final authRepository = AuthRepository();
                  final response = await authRepository.logout();
                  if (response) {
                    GoRouter.of(context).go(AppPath.onboarding);
                  } else {
                    showErrorSnackbar(context, 'Đăng xuất thất bại');
                  }
                },
                icon: Icon(
                  Icons.logout,
                  size: 50,
                )),
          ],
        ),
      ),
    );
  }
}
