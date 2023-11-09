class LandingPadModel {
  String? name;
  String? status;
  String? location;
  String? landigType;

  int? attemps;
  int? landed;
  String? details;
  String? wikiLink;

  LandingPadModel({
    this.attemps,
    this.details,
    this.landed,
    this.landigType,
    this.location,
    this.name,
    this.status,
    this.wikiLink,
  });

  factory LandingPadModel.fromJson(Map<String, dynamic> map) {
    return LandingPadModel(
        name: map["full_name"],
        location: map["location"]["name"],
        details: map["details"],
        status: map["status"],
        attemps: map["attempted_landings"],
        landed: map["successful_landings"],
        landigType: map["landing_type"],
        wikiLink: map["wikipedia"]);
  }
}
