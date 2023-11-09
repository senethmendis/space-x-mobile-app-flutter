import 'package:flutter/material.dart';
import 'package:xxspace/model/capsule_model.dart';

class ViewCapsule extends StatelessWidget {
  const ViewCapsule({super.key, required this.cap});

  final CapsuleModel cap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
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
              Text("${cap.serial}"),
              Text(
                "${cap.id}".toUpperCase(),
                style:
                    const TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              cap.status == "active"
                  ? Container(
                      width: 70,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.green),
                      child: Center(child: Text(cap.status!.toUpperCase())),
                    )
                  : Container(
                      width: 70,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.red),
                      child: Center(child: Text(cap.status!.toUpperCase())),
                    ),
              const SizedBox(
                height: 20,
              ),
              Text("${cap.details}"),
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
                        "Landing : ${cap.landingCount}",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Reuse : ${cap.reuseCount}",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Landing Type : ${cap.type}",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
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
