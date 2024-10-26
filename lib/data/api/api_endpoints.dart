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
}

class MapApi {
  static const autocomplete = "/map/autocomplete";
}
