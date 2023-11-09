import 'package:flutter/material.dart';

class SectionBreacker extends StatelessWidget {
  const SectionBreacker({
    super.key,
    required this.text1,
    required this.text2,
  });

  final String text2;
  final String text1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          Text(
            text2,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
