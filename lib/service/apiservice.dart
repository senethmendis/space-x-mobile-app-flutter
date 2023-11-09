import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:xxspace/model/capsule_model.dart';
import 'package:xxspace/model/landingpad_model.dart';
import 'package:xxspace/model/rocket_model.dart';

class ApiService {
  final rocketEndPoint = "https://api.spacexdata.com/v3/rockets";
  final landingEndPointPoint = "https://api.spacexdata.com/v3/landpads";
  final capsuleEndPointPoint = "https://api.spacexdata.com/v3/capsules";

  Future<List<RocketModel>> getRocketData() async {
    Response response = await get(Uri.parse(rocketEndPoint));

    if (response.statusCode == 200) {
      List body = jsonDecode(response.body);
      // Logger().d(body);
      List<RocketModel> rockets = body.map((e) {
        return RocketModel.fromJson(e);
      }).toList();

      return rockets;
    } else {
      Logger().e(response.statusCode);
      return [];
    }
  }

  Future<List<LandingPadModel>> getLandingPadData() async {
    Response response = await get(Uri.parse(landingEndPointPoint));

    if (response.statusCode == 200) {
      List body = jsonDecode(response.body);
      List<LandingPadModel> landingPads = body.map((pad) {
        return LandingPadModel.fromJson(pad);
      }).toList();
      return landingPads;
    } else {
      Logger().e(response.statusCode);
      return [];
    }
  }

  Future<List<CapsuleModel>> getCapsuleData() async {
    Response response = await get(Uri.parse(capsuleEndPointPoint));

    if (response.statusCode == 200) {
      List body = jsonDecode(response.body);
      List<CapsuleModel> capsules = body.map((capsule) {
        return CapsuleModel.fromJson(capsule);
      }).toList();
      Logger().d(capsules);
      return capsules;
    } else {
      Logger().e(response.statusCode);
      return [];
    }
  }
}
