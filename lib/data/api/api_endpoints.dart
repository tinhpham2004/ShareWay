class AuthApi {
  // register
  static const initRegister = "/auth/init-register";
  static const resendOtp = "/auth/resend-otp";
  static const verifyRegisterOtp = "/auth/verify-register-otp";
  static const register = "/auth/register";
  static const verifyIdCard = "/auth/verify-cccd";

  // login
  static const loginPhone = "/auth/login-phone";
  static const verifyLoginOtp = "/auth/verify-login-otp";
}

class UserApi {
  static const getProfile = "/user/get-profile";
}
