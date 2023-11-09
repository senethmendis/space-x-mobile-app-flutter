import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xxspace/model/landingpad_model.dart';

class ViewLandingPad extends StatelessWidget {
  const ViewLandingPad({super.key, required this.pad});

  final LandingPadModel pad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Stack(
                alignment: Alignment.topLeft,
                children: [
                  BackButton(
                      color: Colors.white,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.black))),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text("${pad.location}"),
              Text(
                "${pad.name}",
                style:
                    const TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              pad.status == "active"
                  ? Container(
                      width: 70,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.green),
                      child: Center(child: Text(pad.status!.toUpperCase())),
                    )
                  : Container(
                      width: 70,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.red),
                      child: Center(child: Text(pad.status!.toUpperCase())),
                    ),
              const SizedBox(
                height: 20,
              ),
              Text("${pad.details}"),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Overview",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Attemps : ${pad.attemps}",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Landed : ${pad.landed}",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Landing Type : ${pad.landigType}",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      InkWell(
                          child: const Text(
                            'Wiki Open Browser',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () => launchUrl(Uri.parse("${pad.wikiLink}")))
                    ],
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
