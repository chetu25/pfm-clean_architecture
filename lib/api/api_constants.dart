class ApiConstants {
  ApiConstants._();

  static const String baseUrl = "https://pfm-api.aliceblueonline.com/api/";

  static const String phoneLogin = "send-login-otp";
  static const String otpValidateUrl = "validate-login-otp";
  static const String otpResendUrl = "resend-login-otp";
  static const String stageCheck = "get-stage-details";
  static const String sendEmailOtp = "send-email-otp";
  static const String validatEmailOTP = "validate-email-otp";
  static const String mailOtpResendUrl = "resend-email-otp";
  static const String validatePan = "validate-pan-dob";
  static const String updatePan = "update-pan-dob";
  static const String activeplanUrl = "active-subscription";
  static const String updateEmailUrl = "update-email";
  static const String getConsentUrl = "get-setu-consent-url";
  static const String getConsentStatusUrl = "get-setu-consent-status";
  static const String getSessiontUrl = "get-setu-session-status";
  static const String profileUrl = "client-details";
  static const String getBankAccountsUrl = "get-setu-bank-accounts";
  static const String insightStatusUrl = "get-setu-insights-status";
  static const String insightDataUrl = "get-setu-insights";
}
