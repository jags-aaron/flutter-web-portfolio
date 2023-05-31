import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_web_portfolio/model/method.dart';
import 'package:flutter_web_portfolio/ui/about.dart';
import 'package:flutter_web_portfolio/ui/feature_project.dart';
import 'package:flutter_web_portfolio/ui/work.dart';
import 'package:flutter_web_portfolio/widget/appbar_title.dart';
import 'package:flutter_web_portfolio/widget/custom_text.dart';
import 'package:flutter_web_portfolio/widget/main_tiitle.dart';
import 'package:flutter_web_portfolio/widget/os_images.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Method method = Method();
  late AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpaned = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
        () => _isAppBarExpanded
            ? isExpaned != false
                ? setState(
                    () {
                      isExpaned = false;
                      debugPrint('setState is called');
                    },
                  )
                : {}
            : isExpaned != true
                ? setState(() {
                    debugPrint('setState is called');
                    isExpaned = true;
                  })
                : {},
      );
    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
    );
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({required int index, required Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xff0A192F),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          primary: true,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //Mavigation Bar
              SizedBox(
                height: size.height * 0.14,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      const Spacer(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DefaultTabController(
                            length: 4,
                            child: TabBar(
                              indicatorColor: Colors.transparent,
                              onTap: (index) async {
                                _scrollToIndex(index);
                              },
                              tabs: const [
                                Tab(
                                  child: AppBarTitle(
                                    text: 'About',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Experience',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Project',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Contact',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Card(
                          elevation: 4.0,
                          color: const Color(0xff64FFDA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(0.85),
                            height: size.height * 0.07,
                            width: size.height * 0.20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xff0A192F),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: TextButton(
                              onPressed: () {
                                method.launchURL(
                                    "https://drive.google.com/file/d/1FPwrhc42Fs8BNfcjVlAOa7hz2B652Drf/view?usp=share_link");
                              },
                              child: const Text(
                                "Resume",
                                style: TextStyle(
                                  color: Color(0xff64FFDA),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  //Social Icon
                  SizedBox(
                    width: size.width * 0.09,
                    height: size.height - 82,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            icon: const FaIcon(FontAwesomeIcons.github),
                            color: const Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchURL("https://github.com/jags-aaron");
                            }),
                        IconButton(
                            icon: const FaIcon(FontAwesomeIcons.twitter),
                            color: const Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchURL("https://twitter.com/AaronJags");
                            }),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.linkedin),
                          color: const Color(0xffffA8B2D1),
                          onPressed: () {
                            method.launchURL(
                                "https://www.linkedin.com/in/aaron-garcia-69a18681/");
                          },
                          iconSize: 16.0,
                        ),
                        IconButton(
                            icon: const Icon(Icons.call),
                            color: const Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchCaller();
                            }),
                        IconButton(
                            icon: const Icon(Icons.mail),
                            color: const Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchEmail();
                            }),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            height: size.height * 0.20,
                            width: 2,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: size.height - 82,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomScrollView(
                          controller: _autoScrollController,
                          slivers: <Widget>[
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: size.height * .06,
                                      ),
                                      const CustomText(
                                        text: "Hi, my name is",
                                        textsize: 16.0,
                                        color: Color(0xff41FBDA),
                                        letterSpacing: 3.0,
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      const CustomText(
                                        text: "Aaron Garcia.",
                                        textsize: 68.0,
                                        color: Color(0xffCCD6F6),
                                        fontWeight: FontWeight.w900,
                                      ),
                                      const SizedBox(
                                        height: 4.0,
                                      ),
                                      CustomText(
                                        text: "I build Mobile apps.",
                                        textsize: 45.0,
                                        color: const Color(0xffCCD6F6)
                                            .withOpacity(0.6),
                                        fontWeight: FontWeight.w700,
                                      ),
                                      SizedBox(
                                        height: size.height * .04,
                                      ),
                                      Wrap(
                                        children: const [
                                          Text(
                                            "I'm a freelancer based in Guadalajara, Mexico. "
                                            "\nSpecialized in mobile app development "
                                            "\nusing native (Swift | Kotlin) "
                                            "\nand hybrid (flutter)",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16.0,
                                              letterSpacing: 2.75,
                                              wordSpacing: 0.75,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * .12,
                                      ),

                                      //get in tuch text
                                      InkWell(
                                        onTap: () {
                                          method.launchEmail();
                                        },
                                        hoverColor: const Color(0xff64FFDA)
                                            .withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: size.height * 0.09,
                                          width: size.width * 0.14,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color(0xff64FFDA),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          child: const Text(
                                            "Get In Touch",
                                            style: TextStyle(
                                              color: Color(0xff64FFDA),
                                              letterSpacing: 2.75,
                                              wordSpacing: 1.0,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.20,
                                      ),
                                    ],
                                  ),

                                  //About Me
                                  _wrapScrollTag(
                                    index: 0,
                                    child: About(),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),

                                  //Where I've Worked
                                  _wrapScrollTag(
                                    index: 1,
                                    child: const Work(),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.10,
                                  ),

                                  //Some Things I've Built Main Project
                                  _wrapScrollTag(
                                      index: 2,
                                      child: Column(
                                        children: [
                                          const MainTitle(
                                            number: "0.3",
                                            text: "Some Things I've Built",
                                          ),
                                          SizedBox(
                                            height: size.height * 0.04,
                                          ),
                                          FeatureProject(
                                            imagePath: "images/pic_nubank.png",
                                            ontab: () {
                                              method.launchURL(
                                                  "https://play.google.com/store/search?q=Nubank&c=apps");
                                            },
                                            projectTitle: "Nubank",
                                            projectDesc:
                                                """Nubank is a Brazilian neobank and the largest fintech bank in Latin America. Its headquarters are located in São Paulo, Brazil. The company also has engineering offices in Berlin, Germany, Buenos Aires, Argentina, and an office in Mexico City, Mexico.""",
                                            tech1:
                                                "Flutter (Dart)\nAndroid (Kotlin)\nIOS (Swift)",
                                          ),
                                          FeatureProject(
                                            imagePath: "images/pic_crabi.png",
                                            ontab: () {
                                              method.launchURL(
                                                  "https://play.google.com/store/apps/details?id=com.crabi.customerjourneys");
                                            },
                                            projectTitle: "Crabi",
                                            projectDesc:
                                                "Crabi is a vertically-integrated Insurtech carrier which uses big data to analyze individual"
                                                "driving behavior, thus allowing us to offer personalized premiums specific to each driver’s risk"
                                                "profile We highly personalize car insurance through mobile technology.",
                                            tech1:
                                                "Flutter (Dart)\nAndroid (Kotlin)\nIOS (Swift)",
                                          ),
                                          FeatureProject(
                                            imagePath: "images/pic_secapp.png",
                                            ontab: () {
                                              method.launchURL(
                                                  "https://play.google.com/store/search?q=secapp&c=apps");
                                            },
                                            projectTitle: "Secapp",
                                            projectDesc:
                                                "This application helps you to send alerts and notify all users that you"
                                                "added in your friends circle when you are in danger, sending audio/video streaming if you want"
                                                "from your device.",
                                            tech2: "Android (Kotlin)",
                                          ),
                                          FeatureProject(
                                            imagePath:
                                                "images/pic_cnn_expansion.png",
                                            ontab: () {
                                              method.launchURL(
                                                  "https://expansion.mx/");
                                            },
                                            projectTitle: "CNN Expansion",
                                            projectDesc:
                                                "is the mobile application of the Brand Leader in the Information Business"
                                                "and Economics in Mexico. It shows the news about world business, finance, markets,"
                                                "technology, politics and national events.",
                                            tech2: "Android (Kotlin)",
                                          ),
                                          FeatureProject(
                                            imagePath: "images/pic_tigo.png",
                                            ontab: () {
                                              method.launchURL(
                                                  "https://play.google.com/store/apps/details?id=com.millicom.tigo");
                                            },
                                            projectTitle: "Campeones Tigo",
                                            projectDesc:
                                                "TIGO is a Colombian telecommunications company. It has as majority"
                                                "shareholder Millicom International Cellular. This application monitors your performance"
                                                "indicators throughout the month and keep visibility of your results and historical trends",
                                            tech2: "React Native (Javascript)",
                                          ),
                                          FeatureProject(
                                            imagePath: "images/pic_pitz.png",
                                            ontab: () {
                                              method.launchURL(
                                                  "https://play.google.com/store/search?q=pitz&c=apps");
                                            },
                                            projectTitle: "Pitz",
                                            projectDesc:
                                                "is a focused mobile app for amateur soccer players, they can schedule matches,"
                                                "watch the player of the match, statistics and all in real time powered by Firebase",
                                            tech2: "Android (Kotlin)",
                                          ),
                                        ],
                                      )),

                                  const SizedBox(
                                    height: 6.0,
                                  ),

                                  //Get In Touch
                                  _wrapScrollTag(
                                    index: 3,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: size.height * 0.68,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              100,
                                          // color: Colors.orange,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const CustomText(
                                                text: "What's Next?",
                                                textsize: 16.0,
                                                color: Color(0xff41FBDA),
                                                letterSpacing: 3.0,
                                              ),
                                              const SizedBox(
                                                height: 16.0,
                                              ),
                                              const CustomText(
                                                text: "Get In Touch",
                                                textsize: 42.0,
                                                color: Colors.white,
                                                letterSpacing: 3.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              const SizedBox(
                                                height: 16.0,
                                              ),
                                              Wrap(
                                                children: [
                                                  Text(
                                                    "Although I'm currently looking for Freelance part-time opportunities, my inbox is \nalways open. Whether you have a question or just want to say hi, I'll try my \nbest to get back to you!",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(0.4),
                                                      letterSpacing: 0.75,
                                                      fontSize: 17.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 32.0,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  method.launchEmail();
                                                },
                                                child: Card(
                                                  elevation: 4.0,
                                                  color:
                                                      const Color(0xff64FFDA),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0),
                                                  ),
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            0.85),
                                                    height: size.height * 0.09,
                                                    width: size.width * 0.10,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xff0A192F),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                    ),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                      ),
                                                      child: Text(
                                                        "Say Hello",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff64FFDA),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        //Footer
                                        Container(
                                          alignment: Alignment.center,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              100,
                                          //color: Colors.white,
                                          child: Text(
                                            "Page Build on 💙 Flutter",
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.4),
                                              letterSpacing: 1.75,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.height - 82,
                    //color: Colors.orange,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RotatedBox(
                          quarterTurns: 45,
                          child: Text(
                            "aaron.jags.dev@gmail.com",
                            style: TextStyle(
                              color: Colors.grey.withOpacity(0.6),
                              letterSpacing: 3.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            height: 100,
                            width: 2,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
