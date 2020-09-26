import 'package:flutter/material.dart';

class SlideIndicator extends StatelessWidget {
  final dynamic slidePages;
  final int currentPage;
  final Color color;

  SlideIndicator({ this.slidePages, this.currentPage, this.color });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List<Widget>.generate(
        slidePages.length,
        (int index) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 10,
            width: (index == currentPage) ? 30 : 10,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: (index == currentPage)
                  ? color
                  : color.withOpacity(0.5)
            )
          );
        }
      ),
    );
  }
}