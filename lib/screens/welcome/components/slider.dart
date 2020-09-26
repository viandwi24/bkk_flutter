import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlidePage extends StatelessWidget {
  final String title;
  final String image;
  final String description;

  SlidePage({ this.title, this.image, this.description });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return new Container(
      padding: EdgeInsets.fromLTRB(50, 10, 50, 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            image,
            width: width * 0.6,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
          SizedBox(height: 15),
          Text(
            description,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}