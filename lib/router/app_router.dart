import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/presentation/account/account_screen.dart';
import 'package:share_way_frontend/presentation/activity/activity_screen.dart';
import 'package:share_way_frontend/presentation/auth/models/auth_data.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/take_photo_id_card_screen.dart';
import 'package:share_way_frontend/presentation/chat/chat_screen.dart';
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
              path: AppPath.error,
              builder: (context, state) => const ErrorScreen(),
            ),
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
                final AuthData authData = state.extra as AuthData;
                return SignUpNameScreen(authData: authData);
              },
            ),
            GoRoute(
              path: AppPath.verifyIdCard,
              builder: (context, state) {
                final AuthData authData = state.extra as AuthData;
                return VerifyIdCardScreen(authData: authData);
              },
            ),
            GoRoute(
              path: AppPath.takePhotoIdCard,
              builder: (context, state) {
                final AuthData authData = state.extra as AuthData;
                return TakePhotoIdCardScreen(authData: authData);
              },
            ),
            GoRoute(
              path: AppPath.otp,
              builder: (context, state) {
                final AuthData authData = state.extra as AuthData;
                // final authData =
                //     AuthData(phoneNumber: '+84938391457', path: AppPath.signUp);
                return OtpScreen(authData: authData);
              },
            ),
            GoRoute(
              path: AppPath.home,
              builder: (context, state) {
                return HomeScreen();
              },
            ),
            GoRoute(
              path: AppPath.activity,
              builder: (context, state) {
                return const ActivityScreen();
              },
            ),
            GoRoute(
              path: AppPath.chat,
              builder: (context, state) {
                return const ChatScreen();
              },
            ),
            GoRoute(
              path: AppPath.account,
              builder: (context, state) {
                return const AccountScreen();
              },
            ),
          ],
          errorBuilder: (context, state) => const ErrorScreen(),
        );
}
