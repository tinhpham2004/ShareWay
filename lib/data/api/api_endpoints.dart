class AuthApi {
  // register
  static const initRegister = "/auth/init-register";
  static const resendOtp = "/auth/resend-otp";
  static const verifyRegisterOtp = "/auth/verify-register-otp";
  static const register = "/auth/register";
  static const verifyIdCard = "/auth/verify-cccd";

  // login
  static const loginPhone = "/auth/login-phone";
  static const loginOauth = "/auth/login-oauth";
  static const verifyLoginOtp = "/auth/verify-login-otp";

  // logout
  static const logout = "/auth/logout";
}

class UserApi {
  static const getProfile = "/user/get-profile";
  static const registerDeviceToken = "/user/register-device-token";
  static const updateProfile = "/user/update-profile";
  static const updateAvatar = "/user/update-avatar";
}

class MapApi {
  static const autocomplete = "/map/autocomplete";
  static const geocode = "/map/geocode";
  static const createGiveRide = "/map/give-ride";
  static const createHitchRide = "/map/hitch-ride";
  static const suggestHitchRides = "/map/suggest-hitch-rides";
  static const suggestGiveRides = "/map/suggest-give-rides";
}

class VehicleApi {
  static const getVehicles = "/vehicle/vehicles";
  static const registerVehicle = "/vehicle/register-vehicle";
  static const getUserVehicle = "/vehicle/get-vehicle";
}

class RideApi {
  static const hitchRideRequest = "/ride/hitch-ride-request";
  static const givehRideRequest = "/ride/give-ride-request";
  static const acceptHitchRideRequest = "/ride/accept-hitch-ride-request";
  static const acceptGiveRideRequest = "/ride/accept-give-ride-request";
  static const cancelHitchRideRequest = "/ride/cancel-hitch-ride-request";
  static const cancelGiveRideRequest = "/ride/cancel-give-ride-request";
  static const startRide = "/ride/start-ride";
  static const updateRideLocation = "/ride/update-ride-location";
  static const endRide = "/ride/end-ride";
  static const cancelRide = "/ride/cancel-ride";
  static const getAllPendingRide = "/ride/get-all-pending-ride";
  static const ratingRideDriver = "/ride/rating-ride-driver";
  static const ratingRideHitcher = "/ride/rating-ride-hitcher";
  static const getRideHistory = "/ride/get-ride-history";
}

class ChatApi {
  static const getChatRooms = "/chat/get-chat-rooms";
  static const getChatMessages = "/chat/get-chat-messages";
  static const sendMessage = "/chat/send-message";
  static const sendImage = "/chat/send-image";
  static const initiateCall = "/chat/initiate-call";
  static const updateCallStatus = "/chat/update-call-status";
  static const searchUsers = "/chat/search-users";
}

class PaymentApi {
  static const linkMomoWallet = "/payment/link-momo-wallet";
}
