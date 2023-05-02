import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/widget/work_custom_data.dart';

class WorkBox extends StatelessWidget {
  const WorkBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorkCustomData(
          title: "NuBank - Android | IOS | Flutter",
          subTitle:
          """
Nubank is a Brazilian neobank and the largest fintech bank in Latin America. Its headquarters
are located in São Paulo, Brazil. The company also has engineering offices in Berlin, Germany,
Buenos Aires, Argentina, and an office in Mexico City, Mexico. On December 09, 2021, Nubank
officially launched its public IPO offering on the NYSE, valuing the company at US\$45 billion,
making it the most valuable digital neobank.
My work at the Growth team is to help increase the rate of customer acquisition, retention,
and revenue by optimizing products and inventing new marketing channels. 
              """,
          duration: "October 2021 - Current",
        ),
        WorkCustomData(
          title: "Crabi - Android | IOS | Flutter",
          subTitle:
          """
Crabi is a vertically-integrated Insurtech carrier which uses big data to analyze individual
driving behavior, thus allowing us to offer personalized premiums specific to each driver’s risk
profile We highly personalize car insurance through mobile technology. Analyzing speed and
geolocation data with in-house algorithms to classify driver risk profiles. Policy acquisition is
managed and personalize digitally. There is an Opportunity on the market as insurance pricing
does not use big data and are thus generalized as to offset heterogeneous drive risk profiles,
adding that the industry is offline – physical vs digital policy issuance, poor customer service &
difficulty in getting reimbursed
          """,
          duration:
          """
Flutter Developer (August 2020 - October 2021)
Lead Mobile Developer (July 2020 - August 2020)
Android Developer (January 2019 - July 2020)
          """,
        ),
        WorkCustomData(
          title:
          "Amplemind - Android | React Native",
          subTitle:
          """
Amplemind is an app development-focused technology agency based in Guadalajara, 
Mexico with offices at San Francisco and Ciudad de México too. 
We're a nimble, multi-disciplinary team that works seamlessly with Startups and Agencies 
who are looking for senior developers and technology professionals 
to help them tackle their backlog of product ambitions. 
No matter if you are a startup or a big corporate intrapreneur, or even if you are just
behind schedule and need an extra pair of coders. We are here for you. 
          """
          ,
          duration: "January 2016 - January 2018",
        ),
        WorkCustomData(
          title: "Secapp - Android",
          subTitle:
          """
Secapp is an application that helps you to send alerts and notify all users that you
added in your friends circle when you are in danger, sending audio/video streaming if you want
from your device. Also you can select danger and safety zones to all the community of people
who join to help each other to make this a better place to live with things as simple as asking
for help to get your pet to make anonymous complaints or assistance in kidnapping case.
          """,
          duration: "September 2015 - December 2015",
        ),
        WorkCustomData(
          title: "Jaguar Labs - Android",
          subTitle:
          """
Projects:
- Terra Emprendedores is a mobile application built for The Client MUNDO TERRA, the
app is a tool to manage your orders and check availability of them, the app allow you to
take control of your customers, set reminders, and show the results as charts.
- XLR8 is a mobile application built for a coaching company, the purpose of the app is
that the employees can save their goals, values and purposes within the company,
reminding those good practices and good values.
          """,
          duration: "January 2015 - September 2015",
        ),
      ],
    );
  }
}
