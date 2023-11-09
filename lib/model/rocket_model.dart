class RocketModel {
  int? id;
  String? name;
  String? image;
  String? date;
  double? height;
  double? weight;
  String? description;
  bool? status;
  String? country;
  String? engines;
  String? enginesLayout;
  String? enginesVersion;
  double? successRate;

  RocketModel({
    this.id,
    this.name,
    this.image,
    this.date,
    this.status,
    this.description,
    this.height,
    this.weight,
    this.country,
    this.successRate,
    this.engines,
    this.enginesVersion,
    this.enginesLayout,
  });

  factory RocketModel.fromJson(Map<String, dynamic> map) {
    return RocketModel(
      id: map["id"],
      name: map["rocket_name"],
      image: map["flickr_images"][0],
      date: map["first_flight"],
      status: map["active"],
      country: map["country"],
      engines: map["engines"]["type"],
      enginesVersion: map["engines"]["version"],
      enginesLayout: map["engines"]["layout"],
      description: map["description"],
      height: map["height"]["meters"].toDouble(),
      weight: map["mass"]["kg"].toDouble(),
      successRate: map["success_rate_pct"].toDouble(),
    );
  }
}
