class CapsuleModel {
  String? serial;
  String? id;
  String? status;
  String? date;
  int? landingCount;
  String? type;
  int? reuseCount;
  String? details;

  CapsuleModel({
    this.date,
    this.details,
    this.id,
    this.landingCount,
    this.reuseCount,
    this.serial,
    this.status,
    this.type,
  });

  factory CapsuleModel.fromJson(Map<String, dynamic> map) {
    return CapsuleModel(
        id: map["capsule_id"],
        date: map["original_launch"],
        serial: map["capsule_serial"],
        details: map["details"],
        landingCount: map["landings"],
        reuseCount: map["reuse_count"],
        status: map["status"],
        type: map["type"]);
  }
}
