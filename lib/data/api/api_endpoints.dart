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
}
