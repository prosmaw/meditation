import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation/constants.dart';
import 'package:meditation/widgets/bottom_nav_bar.dart';
import 'package:meditation/widgets/search_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              color: kBlueLightColor,
              /* image: DecorationImage(
                  image: AssetImage("assets/icons/yoga.jpg"),
                )*/
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    "Meditation",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "3-10 MIN Course",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: size.width * .6, //it take 60% of the total width
                    child: const Text(
                        "Live happier and healther by learning the fundamentals of meditation and mindfullness"),
                  ),
                  SizedBox(width: size.width * .5, child: const SearchBar()),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 40,
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: <Widget>[
                      SeassionCard(
                        seassionNum: 1,
                        isDone: true,
                        press: () {},
                      ),
                      SeassionCard(
                        seassionNum: 2,
                        press: () {},
                      ),
                      SeassionCard(
                        seassionNum: 3,
                        press: () {},
                      ),
                      SeassionCard(
                        seassionNum: 4,
                        press: () {},
                      ),
                      SeassionCard(
                        seassionNum: 5,
                        press: () {},
                      ),
                      SeassionCard(
                        seassionNum: 6,
                        press: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Meditation",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: EdgeInsets.all(10),
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 17),
                          blurRadius: 23,
                          spreadRadius: -13,
                          color: kShadowColor,
                        )
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          "assets/icons/yoga.svg",
                          height: 50,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Basic 2",
                                style: Theme.of(context).textTheme.subtitle1),
                            const Text("Start your deepen you practice"),
                          ],
                        )),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            "assets/icons/lock.svg",
                            height: 30,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function()? press;
  const SeassionCard({
    Key? key,
    required this.seassionNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, //constraint.maxWidth provide the available for this widget
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 17),
                    blurRadius: 23,
                    spreadRadius: -13,
                    color: kShadowColor)
              ]),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: Row(children: <Widget>[
                  Container(
                    height: 42,
                    width: 43,
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor)),
                    child: Icon(
                      Icons.play_arrow,
                      color: isDone ? Colors.white : kBlueColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("Session $seassionNum",
                      style: Theme.of(context).textTheme.subtitle1)
                ]),
              ),
            ),
          ),
        ),
      );
    });
  }
}
