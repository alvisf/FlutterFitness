// import 'package:myfitnessapp/main.dart';
import 'package:flutter/material.dart';
import '../fintness_app_theme.dart';
// import '../fitness_app_home_screen.dart';
// import 'package:myfitnessapp/fitness_app/traning/package_screen.dart';

import '../package_view.dart';

String todaysWorkoutTitle = "Today's Workout Title : _Name_";
String todaysWorkoutTime = "00";

class WorkoutView extends StatefulWidget {
  final AnimationController animationController;
  final Animation animation;

  const WorkoutView({Key key, this.animationController, this.animation})
      : super(key: key);

  @override
  _WorkoutViewState createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView>
    with TickerProviderStateMixin {
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    FintnessAppTheme.nearlyDarkBlue,
                    FintnessAppTheme.gradientColour,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: FintnessAppTheme.grey.withOpacity(0.6),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PackageView()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Plan Title",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: FintnessAppTheme.fontName,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            letterSpacing: 0.0,
                            color: FintnessAppTheme.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            todaysWorkoutTitle,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: FintnessAppTheme.fontName,
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              letterSpacing: 0.0,
                              color: FintnessAppTheme.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Icon(
                                  Icons.timer,
                                  color: FintnessAppTheme.white,
                                  size: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                  '$todaysWorkoutTime min',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: FintnessAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                    color: FintnessAppTheme.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: FintnessAppTheme.nearlyWhite,
                                  shape: BoxShape.circle,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: FintnessAppTheme.nearlyBlack
                                            .withOpacity(0.4),
                                        offset: Offset(8.0, 8.0),
                                        blurRadius: 8.0),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Icon(
                                    Icons.arrow_right,
                                    color: FintnessAppTheme.gradientColour,
                                    size: 44,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
