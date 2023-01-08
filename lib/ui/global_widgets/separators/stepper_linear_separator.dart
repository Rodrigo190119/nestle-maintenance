import 'package:flutter/material.dart';

class StepperLinearSeparator extends StatelessWidget {

  final double betweenPadding;
  final double horizontalPadding;
  final double topPadding;
  final double bottomPadding;
  final int linearCount;
  final double height;
  final Color linearColor;
  final Color? linearSecondColor;
  final int step;

  const StepperLinearSeparator({
    Key? key,
    this.betweenPadding = 1.0,
    this.horizontalPadding = 0.0,
    this.topPadding = 0.0,
    this.bottomPadding = 0.0,
    this.linearCount = 1,
    this.height = 1.0,
    this.linearColor = Colors.black,
    this.linearSecondColor,
    required this.step,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const int totalSteps = 5;

    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding, left: horizontalPadding, right: horizontalPadding),
      child: SizedBox(
        height: height,
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: linearCount,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(left: (index == 0) ? 0.0 : betweenPadding),
              child: Container(
                width: ( ( width - (horizontalPadding * 2) ) - (betweenPadding * (linearCount - 1)) ) / linearCount,
                height: height,
                color: (linearSecondColor != null) ? (index+1 <= (linearCount * step / totalSteps) ? linearColor : linearSecondColor) : linearColor,
              ),
            )
        ),
      ),
    );
  }

}