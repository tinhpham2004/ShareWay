import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/presentation/error/error_screen.dart';
import 'package:share_way_frontend/presentation/home/home_screen.dart';
import 'package:share_way_frontend/presentation/login/login_screen.dart';
import 'package:share_way_frontend/presentation/login/sub_screens/otp/otp_screen.dart';
import 'package:share_way_frontend/presentation/onboarding/onboarding_screen.dart';
import 'package:share_way_frontend/router/app_path.dart';

class AppRouter {
  final GoRouter _router;

  GoRouter get router => _router;

  AppRouter()
      : _router = GoRouter(
          initialLocation: AppPath.onboarding,
          routes: <GoRoute>[
            GoRoute(
              path: AppPath.onboarding,
              builder: (context, state) => const OnboardingScreen(),
            ),
            GoRoute(
              path: AppPath.login,
              builder: (context, state) => const LoginScreen(),
            ),
            GoRoute(
              path: AppPath.otp,
              builder: (context, state) {
                final phoneNumber = state.extra as String;
                return OtpScreen(phoneNumber: phoneNumber);
              },
            ),
            GoRoute(
              path: AppPath.home,
              builder: (context, state) {
                return const HomeScreen();
              },
            ),
          ],
          errorBuilder: (context, state) => const ErrorScreen(),
          redirect: (context, state) {
            return null;
          },
        );
}
