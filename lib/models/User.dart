import './Seller.dart';

class User {
  String? store_details;
  String? firstname;
  String? country_number_code;
  String? sellerStoreId;
  bool? click_and_collect;
  String? presentation;
  bool? loyaltyExclusive;
  String? sellerId;
  bool? pos;
  Seller? seller_details;
  bool? is_test;
  String? email;
  int? pwd_expired_in_days;
  String? currency_symbol;
  int? roleId;
  String? currency_iso;
  bool? is_password_expiring_soon;
  String? role_code;
  String? accessToken;
  String? lastname;
  bool? loyaltyEnabled;
  bool? is_password_expired;
  bool? is_first_signin;
  String? phone;
  String? default_store_id;
  String? response;
  bool? fulfillment;
  String? tokenType;
  String? default_smp_id;

  User.fromJson(Map<String, dynamic> parsedJson)
      : store_details = parsedJson["store_details"],
        firstname = parsedJson["firstname"],
        country_number_code = parsedJson["country_number_code"],
        sellerStoreId = parsedJson["sellerStoreId"],
        click_and_collect = parsedJson["click_and_collect"],
        presentation = parsedJson["presentation"],
        loyaltyExclusive = parsedJson["loyaltyExclusive"],
        sellerId = parsedJson["sellerId"],
        pos = parsedJson["pos"],
        seller_details = Seller.fromJson(parsedJson["seller_details"]),
        is_test = parsedJson["is_test"],
        email = parsedJson["email"],
        pwd_expired_in_days = parsedJson["pwd_expired_in_days"],
        currency_symbol = parsedJson["currency_symbol"],
        roleId = parsedJson["roleId"],
        currency_iso = parsedJson["currency_iso"],
        is_password_expiring_soon = parsedJson["is_password_expiring_soon"],
        role_code = parsedJson["role_code"],
        accessToken = parsedJson["accessToken"],
        lastname = parsedJson["lastname"],
        loyaltyEnabled = parsedJson["loyaltyEnabled"],
        is_password_expired = parsedJson["is_password_expired"],
        is_first_signin = parsedJson["is_first_signin"],
        phone = parsedJson["phone"],
        default_store_id = parsedJson["default_store_id"],
        response = parsedJson["response"],
        fulfillment = parsedJson["fulfillment"],
        tokenType = parsedJson["tokenType"],
        default_smp_id = parsedJson["default_smp_id"];
}
