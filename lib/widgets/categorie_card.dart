import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategorieCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function()? press;
  const CategorieCard({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          //padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 17,
                  spreadRadius: -23,
                )
              ]),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: <Widget>[
                  Spacer(),
                  SvgPicture.asset(
                    svgSrc,
                    height: 90,
                    width: 90,
                  ),
                  Spacer(),
                  Text(title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                      ))
                ]),
              ),
            ),
          ),
        ));
  }
}
