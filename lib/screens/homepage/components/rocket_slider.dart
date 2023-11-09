import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../model/rocket_model.dart';
import '../../viewpage/view_rocketdata.dart';

class RocketSlider extends StatelessWidget {
  const RocketSlider({
    super.key,
    required this.rockets,
  });

  final List<RocketModel>? rockets;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 250.0),
      items: rockets!.map((rocket) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ViewRocket(rocket: rocket);
                  },
                ));
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                      image: DecorationImage(
                          opacity: 0.6,
                          image: NetworkImage("${rocket.image}"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.share_rounded,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.bookmark,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Container(
                          width: 80,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade300,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 1),
                            child: Center(
                                child: Text(rocket.status == true
                                    ? "Active"
                                    : "Not Active")),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${rocket.name}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            Text(
                              "${rocket.date}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          width: 30,
                          height: 30,
                          child: const Center(
                            child: Icon(
                              Icons.keyboard_arrow_right_outlined,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
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
