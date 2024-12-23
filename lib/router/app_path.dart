abstract class AppPath {
  static const error = '/error';
  static const onboarding = '/onboarding';
  static const auth = '/auth';
  static const login = '/login';
  static const signUp = '/sign-up';
  static const signUpName = '/sign-up-name';
  static const verifyIdCard = '/verify-id-card';
  static const takePhotoIdCard = '/take-photo-id-card';
  static const otp = '/otp';
  static const home = '/home';
  static const activity = '/activity';
  static const chatRooms = '/chat-rooms';
  static const chatDetail = '$chatRooms/chat-detail';
  static const call = '$chatRooms/call';
  static const account = '/account';
  static const editInformation = '/edit-information';
  static const giveRidePickLocation = '/give-ride-pick-location';
  static const giveRidePickTime = '/give-ride-pick-time';
  static const giveRidePickVehicle = '/give-ride-pick-vehicle';
  static const giveRidePreview = '/give-ride-preview';
  static const giveRideRecommendation = '/give-ride-recommendation';
  static const giveRideRecommendationDetail = '$giveRideRecommendation/detail';
  static const giveRideRating = '/give-ride-rating';
  static const giveRideComplete = '/give-ride-complete';
  static const hitchRidePickLocation = '/hitch-ride-pick-location';
  static const hitchRidePickTime = '/hitch-ride-pick-time';
  static const hitchRideReccomendation = '/hitch-ride-recommendation';
  static const hitchRideReccomendationDetail =
      '$hitchRideReccomendation/detail';
  static const hitchRideTracking = '/hitch-ride-tracking';
  static const hitchRideRating = '/hitch-ride-rating';
  static const hitchRideComplete = '/hitch-ride-complete';

  static const pendingRide = '/pending-ride';
  static const manageVehicle = '/manage-vehicle';
  static const addVehicle = '/add-vehicle';
  static const setUpPaymentMethod = '/set-up-payment-method';
  static const paymentMethod = '/payment-method';
}
