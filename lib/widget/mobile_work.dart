import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/widget/mobile_work_box.dart';
import 'package:flutter_web_portfolio/widget/workbox.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MobileWork extends StatefulWidget {
  const MobileWork({super.key});

  @override
  MobileWorkState createState() => MobileWorkState();
}

class MobileWorkState extends State<MobileWork> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          height: size.height * 1.25,
          child: const VerticalDivider(
            color: Color(0xff64FFDA),
            width: 10,
          ),
        ),
        const Expanded(
          child: MobileWorkBox(),
        )
      ],
    );
  }
}
