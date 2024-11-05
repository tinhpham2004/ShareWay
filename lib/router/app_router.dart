import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/domain/map/input/create_give_ride_input.dart';
import 'package:share_way_frontend/domain/map/output/create_give_ride/create_give_ride_output.dart';
import 'package:share_way_frontend/domain/map/output/hitch_ride_recommendation_ouput/hitch_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/domain/shared/models/option_item.dart';
import 'package:share_way_frontend/presentation/account/account_screen.dart';
import 'package:share_way_frontend/presentation/account/sub_screens/vehicle/add_vehicle/add_vehicle_screen.dart';
import 'package:share_way_frontend/presentation/account/sub_screens/vehicle/manage_vehicle/manage_vehicle_screen.dart';
import 'package:share_way_frontend/presentation/activity/activity_screen.dart';
import 'package:share_way_frontend/presentation/auth/models/auth_data.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/take_photo_id_card_screen.dart';
import 'package:share_way_frontend/presentation/chat/chat_screen.dart';
import 'package:share_way_frontend/presentation/error/error_screen.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_pick_location/give_ride_pick_location_screen.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_pick_time/give_ride_pick_time_screen.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_pick_vehicle/give_ride_pick_vehicle_screen.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_preview/give_ride_preview_screen.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_recommendation/give_ride_recommendation_screen.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_recommendation_detail/give_ride_recommendation_detail.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_screen.dart';
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
            GoRoute(
              path: AppPath.giveRidePickLocation,
              builder: (context, state) {
                return GiveRidePickLocationScreen();
              },
            ),
            GoRoute(
              path: AppPath.giveRidePickTime,
              builder: (context, state) {
                final CreateGiveRideInput data =
                    state.extra as CreateGiveRideInput;
                return GiveRidePickTimeScreen(data: data);
              },
            ),
            GoRoute(
              path: AppPath.giveRidePickVehicle,
              builder: (context, state) {
                final CreateGiveRideInput data =
                    state.extra as CreateGiveRideInput;
                // final CreateGiveRideInput data = CreateGiveRideInput(
                //   startTime: DateTime.now(),
                //   locationList: [
                //     OptionItem(idString: '1', name: 'Hà Nội'),
                //     OptionItem(idString: '2', name: 'Hải Phòng'),
                //   ],
                // );
                return GiveRidePickVehicleScreen(data: data);
              },
            ),
            GoRoute(
              path: AppPath.giveRidePreview,
              builder: (context, state) {
                final CreateGiveRideOutput data =
                    state.extra as CreateGiveRideOutput;
                return GiveRidePreviewScreen(data: data);
              },
            ),
            GoRoute(
              path: AppPath.giveRideRecommendation,
              builder: (context, state) {
                final giveRideId = state.extra as String;
                // final giveRideId = 'state.extra as String';
                return GiveRideRecommendationScreen(giveRideId: giveRideId);
              },
            ),
            GoRoute(
              path: AppPath.giveRideRecommendationDetail,
              builder: (context, state) {
                final data = state.extra as HitchRideRecommendationOuput;
                return GiveRideRecommendationDetailScreen(data: data);
              },
            ),
            GoRoute(
              path: AppPath.hitchRide,
              builder: (context, state) {
                return const HitchRideScreen();
              },
            ),
            GoRoute(
              path: AppPath.manageVehicle,
              builder: (context, state) {
                return const ManageVehicleScreen();
              },
            ),
            GoRoute(
              path: AppPath.addVehicle,
              builder: (context, state) {
                return const AddVehicleScreen();
              },
            ),
          ],
          errorBuilder: (context, state) => const ErrorScreen(),
        );
}
