import 'package:flutter/material.dart';

import '../../../model/capsule_model.dart';
import '../../viewpage/view_capsuledata.dart';

class CapsuleSection extends StatelessWidget {
  const CapsuleSection({
    super.key,
    required this.capsule,
  });

  final List<CapsuleModel>? capsule;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(capsule!.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ViewCapsule(
                    cap: capsule![index],
                  );
                },
              ));
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(5)),
              child: ListTile(
                title: Text("${capsule![index].serial}"),
                subtitle: Text("${capsule![index].date}"),
                textColor: Colors.white,
                leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "${capsule![index].landingCount}",
                      style: const TextStyle(color: Colors.black),
                    )),
              ),
            ),
          ),
        );
      }),
    );
  }
}
