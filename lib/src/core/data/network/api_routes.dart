class ApiRoutes {
  // CDU server url
  // static const baseUrl = "http://admin.rotate.clouddownunder.com.au/api/v1";

  // DEV server url
  // static const baseUrl = "http://3.27.26.3/api/v1";
  // static const baseUrl = "http://54.252.249.212/api/v1";

  static const baseUrl = "https://devzauce.clouddownunder.com.au/api";

  static const signUp = "/signUp";
  static const signIn = "/login";
  static const forgotPassword = "/ForgotPassword";
  static const logout = "/Logout";
  static const referralCode = "/validateReferralCode";
  static const changePassword = "/changePassword";
  static const verifyEmailOTP = "/verifyEmailOTP";
  static const changeAccountType = "/changeAccountType";
  static const getProfile = "/getProfile";
  static const getNotifications = "/get-notification";
  static const getNotificationsCount = "/get-notification-count";
}
