import 'package:flutter/material.dart';
import 'package:xxspace/model/capsule_model.dart';
import 'package:xxspace/model/landingpad_model.dart';
import 'package:xxspace/model/rocket_model.dart';
import 'package:xxspace/service/apiservice.dart';

import 'components/capsule_section.dart';
import 'components/custom_nav.dart';
import 'components/landingpad_section.dart';
import 'components/rocket_slider.dart';
import 'components/section_breacker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService service = ApiService();
  List<RocketModel>? rockets = [];
  List<LandingPadModel>? pads = [];
  List<CapsuleModel>? capsule = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomNavigation(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: SectionBreacker(text1: "Rockets", text2: "Show More"),
                ),
                FutureBuilder(
                  future: service.getRocketData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      rockets = snapshot.data;
                      // Logger().e(rockets);
                      return RocketSlider(rockets: rockets);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: SectionBreacker(
                      text1: "Landing Pads", text2: "Show More"),
                ),
                FutureBuilder(
                  future: service.getLandingPadData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      pads = snapshot.data;
                      return LandingPadSlider(pads: pads);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const SectionBreacker(text1: "Capsules", text2: "All"),
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  future: service.getCapsuleData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      capsule = snapshot.data;

                      return CapsuleSection(capsule: capsule);
                    } else {
                      return const Center(child: Text("NO data"));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
