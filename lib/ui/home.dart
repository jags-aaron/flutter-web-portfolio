import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/ui/mobile_home.dart';
import 'package:flutter_web_portfolio/ui/home_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth >= 1000) {
          return const HomePage();
        } else {
          return const MobileHome();
        }
      }
    );
  }
}
