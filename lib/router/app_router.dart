import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/presentation/auth/models/auth_data.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/take_photo_id_card_screen.dart';
import 'package:share_way_frontend/presentation/error/error_screen.dart';
import 'package:share_way_frontend/presentation/home/home_screen.dart';
import 'package:share_way_frontend/presentation/auth/auth_screen.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/otp/otp_screen.dart';
import 'package:share_way_frontend/presentation/onboarding/onboarding_screen.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/sign_up_name/sign_up_name_screen.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/verify_id_card_screen.dart';
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
              path: AppPath.auth,
              builder: (context, state) {
                final path = state.extra as String;
                return AuthScreen(path: path);
              },
            ),
            GoRoute(
              path: AppPath.signUpName,
              builder: (context, state) {
                return SignUpNameScreen();
              },
            ),
            GoRoute(
              path: AppPath.verifyIdCard,
              builder: (context, state) {
                return const VerifyIdCardScreen();
              },
            ),
            GoRoute(
              path: AppPath.takePhotoIdCard,
              builder: (context, state) {
                return TakePhotoIdCardScreen();
              },
            ),
            GoRoute(
              path: AppPath.otp,
              builder: (context, state) {
                final AuthData authData = state.extra as AuthData;
                return OtpScreen(authData: authData);
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
