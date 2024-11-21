import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/domain/chat/output/init_call_output/init_call_output.dart';
import 'package:share_way_frontend/domain/map/input/create_give_ride_input.dart';
import 'package:share_way_frontend/domain/map/input/create_hitch_ride_input.dart';
import 'package:share_way_frontend/domain/map/output/create_give_ride/create_give_ride_output.dart';
import 'package:share_way_frontend/domain/map/output/give_ride_recommendation_ouput/give_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/domain/map/output/hitch_ride_recommendation_ouput/hitch_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/presentation/account/account_screen.dart';
import 'package:share_way_frontend/presentation/account/sub_screens/vehicle/add_vehicle/add_vehicle_screen.dart';
import 'package:share_way_frontend/presentation/account/sub_screens/vehicle/manage_vehicle/manage_vehicle_screen.dart';
import 'package:share_way_frontend/presentation/activity/activity_screen.dart';
import 'package:share_way_frontend/presentation/auth/models/auth_data.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/take_photo_id_card_screen.dart';
import 'package:share_way_frontend/presentation/chat/bloc/chat_rooms_bloc.dart';
import 'package:share_way_frontend/presentation/chat/chat_rooms_screen.dart';
import 'package:share_way_frontend/presentation/chat/sub_screens/call/call_screen.dart';
import 'package:share_way_frontend/presentation/chat/sub_screens/chat_detail/chat_detail_screen.dart';
import 'package:share_way_frontend/presentation/error/error_screen.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_complete/give_ride_complete_screen.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_pick_location/give_ride_pick_location_screen.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_pick_time/give_ride_pick_time_screen.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_pick_vehicle/give_ride_pick_vehicle_screen.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_preview/give_ride_preview_screen.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_recommendation/give_ride_recommendation_screen.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_recommendation_detail/give_ride_recommendation_detail_screen.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_complete/hitch_ride_complete_screen.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_pick_location/hitch_ride_pick_location_screen.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_pick_time/hitch_ride_pick_time_screen.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_recommendation/hitch_ride_recommendation_screen.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_recommendation_detail/hitch_ride_recommendation_detail_screen.dart';
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

  AppRouter(GlobalKey<NavigatorState> navigatorKey)
      : _router = GoRouter(
          initialLocation: AppPath.onboarding,
          navigatorKey: navigatorKey,
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
              path: AppPath.chatRooms,
              builder: (context, state) {
                return const ChatRoomsScreen();
              },
            ),
            GoRoute(
              path: AppPath.chatDetail,
              builder: (context, state) {
                final chatRoomsBloc = state.extra as ChatRoomsBloc;
                return ChatDetailScreen(chatRoomsBloc: chatRoomsBloc);
              },
            ),
            GoRoute(
              path: AppPath.call,
              builder: (context, state) {
                final data = state.extra as InitCallOutput;
                // final data = InitCallOutput(
                //   callId: 'callId',
                //   token: 'token',
                //   roomId: 'roomId',
                //   callerId: 'callerId',
                //   receiverId: 'receiverId',
                // );
                return CallScreen(data: data);
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
                final CreateGiveRideOutput data =
                    state.extra as CreateGiveRideOutput;
                // final giveRideId = 'state.extra as String';
                return GiveRideRecommendationScreen(data: data);
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
              path: AppPath.giveRideComplete,
              builder: (context, state) {
                return GiveRideCompleteScreen();
              },
            ),
            GoRoute(
              path: AppPath.hitchRidePickLocation,
              builder: (context, state) {
                return HitchRidePickLocationScreen();
              },
            ),
            GoRoute(
              path: AppPath.hitchRidePickTime,
              builder: (context, state) {
                final CreateHitchRideInput data =
                    state.extra as CreateHitchRideInput;
                // final data = CreateHitchRideInput(
                //   locationList: [
                //     OptionItem(
                //       idString:
                //           'ubz1uBhrxZFnv0cjaEdDnbOuSwxeQ5KMXr0hDo9tgvFekXUrvEeC02zLU6KkZ7DmfDuGgI2tCjnlYkYoVvEKzjGi_KA-kb479aq5YTDd-judrlEuOGBhDjmm8njOOGUPO',
                //       name: 'Hà Nội',
                //     ),
                //     OptionItem(
                //       idString:
                //           'o33FjXyhvb1zvCtPkslrjbCvfiP_cm_JXL16DbC_jd1tk0A1b0asjVysaji8fp1AW5TSSb8akiJzhVg3v0eVvFvNVDI0RI3Eaa1bjU99jeRol0gbux1udjWq_QDCNGvbN',
                //       name: 'Hải Phòng',
                //     ),
                //   ],
                // );
                return HitchRidePickTimeScreen(data: data);
              },
            ),
            GoRoute(
              path: AppPath.hitchRideReccomendation,
              builder: (context, state) {
                final hitchRideId = state.extra as String;
                return HitchRideRecommendationScreen(hitchRideId: hitchRideId);
              },
            ),
            GoRoute(
              path: AppPath.hitchRideReccomendationDetail,
              builder: (context, state) {
                final data = state.extra as GiveRideRecommendationOuput;
                // final data = GiveRideRecommendationOuput(
                //   giveRideId: '1',
                //   distance: 10,
                //   duration: 10,
                //   fare: 5.5,
                //   polyline: 'polyline',
                //   startLocation: Geocode(
                //     latitude: 10.111,
                //     longitude: 10.111,
                //   ),
                //   endLocation: Geocode(
                //     latitude: 10.111,
                //     longitude: 10.111,
                //   ),
                //   startTime: DateTime.now(),
                //   endTime: DateTime.now(),
                //   user: AppUser(
                //     createdAt: DateTime.now(),
                //     email: 'email',
                //     fullName: 'fullName',
                //     id: 'id',
                //     phoneNumber: 'phoneNumber',
                //     updatedAt: DateTime.now(),
                //   ),
                //   vehicle: GetVehicleOuput(
                //     vehicleId: 'vehicleId',
                //     name: 'name',
                //     licensePlate: 'licensePlate',
                //     fuelConsumed: 10,
                //   ),
                // );
                return HitchRideRecommendationDetailScreen(data: data);
              },
            ),
            GoRoute(
              path: AppPath.hitchRideComplete,
              builder: (context, state) {
                return HitchRideCompleteScreen();
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
