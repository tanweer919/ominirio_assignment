class Seller {
  String? seller_logo;
  String? name;
  String? term_condition_url;
  bool? is_term_condition;
  String? buisness_name;
  String? seller_id;

  Seller.fromJson(Map<String, dynamic> parsedJson)
      : seller_logo = parsedJson["seller_logo"],
        name = parsedJson["name"],
        term_condition_url = parsedJson["term_condition_url"],
        is_term_condition = parsedJson["is_term_condition"],
        buisness_name = parsedJson["buisness_name"],
        seller_id = parsedJson["seller_id"];
}
