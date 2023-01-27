import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation/constants.dart';
import 'package:meditation/screens/details_screen.dart';
import 'package:meditation/widgets/bottom_nav_bar.dart';
import 'package:meditation/widgets/categorie_card.dart';
import 'package:meditation/widgets/search_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const BottomNav(),
      body: Stack(
        children: <Widget>[
          Container(
            //height of the container is 45% of the total height
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: Color(0xFFF5CEBB),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 52,
                      width: 52,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    )),
                const Text("Good Morning \nProsper",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    )),
                const SearchBar(),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .85,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: <Widget>[
                      CategorieCard(
                        svgSrc: 'assets/icons/burger.svg',
                        title: 'Diete Recommandation',
                        press: () {},
                      ),
                      CategorieCard(
                        svgSrc: 'assets/icons/exercice.svg',
                        title: 'Kegel exercises',
                        press: () {},
                      ),
                      CategorieCard(
                        svgSrc: 'assets/icons/yoga.svg',
                        title: 'meditation',
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DetailsScreen()),
                          );
                        },
                      ),
                      CategorieCard(
                        svgSrc: 'assets/icons/yoga.svg',
                        title: 'yoga',
                        press: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
