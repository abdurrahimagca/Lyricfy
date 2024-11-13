/// 666X - General Errors
/// 1XXX - Auth Errors
/// 2XXX - Database Errors
/// 3XXX - Storage Errors
/// 4XXX - Notification Errors
/// 11xx1 -Auth Mux : 11001 true 11000 false
/// 22xx1 -Database Mux: 22001 true 22000 false

library errors;

class CustomErrors {
  //errors
  static const int NO_ERR = 1;
  static const int UNKNOWN_ERROR = 6660;
  static const int UPS_STH_WENT_WRONG = 6661;
  static const int AUTH_COULDNT_CONNECT_AUTH_PROVIDER = 1001;
  static const int AUTH_NO_USER_AFTER_OAuth = 1002;
  static const int DB_CANNOT_ATTEMPT_INSERT_NO_AUTH = 2001;
  static const int AUTH_AND_DB_USER_EXISTS = 2000; 
  static const int DB_INSERT_USER_DID_NOT_WORKED = 2003;
  static const int DEVICE_VISUAL_COULDNT_GET = 6662;
  //mux
  static const int DB_MUX_USER_EXISTS = 22011;
  static const int DB_MUX_USER_DOES_NOT_EXIST = 22000;
}
