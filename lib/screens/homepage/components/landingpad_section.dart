import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../model/landingpad_model.dart';
import '../../viewpage/view_landingpaddata.dart';

class LandingPadSlider extends StatelessWidget {
  const LandingPadSlider({
    super.key,
    required this.pads,
  });

  final List<LandingPadModel>? pads;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 100.0),
      items: pads!.map((pad) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ViewLandingPad(
                      pad: pad,
                    );
                  },
                ));
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${pad.name}',
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                        ),
                        Text(
                          '${pad.location}',
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                        ),
                        pad.status == "active"
                            ? Container(
                                width: 70,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.green),
                                child: Center(child: Text("${pad.status}")),
                              )
                            : Container(
                                width: 70,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.red),
                                child: Center(child: Text("${pad.status}")),
                              )
                      ],
                    ),
                  )),
            );
          },
        );
      }).toList(),
    );
  }
}
