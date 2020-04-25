// import 'package:myfitnessapp/fitness_app/ui_view/wave_view.dart';
import 'package:myfitnessapp/fitness_app/fintness_app_theme.dart';
// import 'package:myfitnessapp/main.dart';
import 'package:flutter/material.dart';
import 'package:myfitnessapp/fitness_app/models/info.dart';

class WeeksList extends StatefulWidget {
  const WeeksList(
      {Key key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation<dynamic> mainScreenAnimation;

  @override
  _WeeksListState createState() => _WeeksListState();
}

class _WeeksListState extends State<WeeksList> with TickerProviderStateMixin {
  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                  height: 470.0,
                  decoration: BoxDecoration(
                    color: FitnessAppTheme.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: FitnessAppTheme.grey.withOpacity(0.2),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    children: List<Widget>.generate(
                      ListData.packPlanData.length,
                      (int index) {
                        final int count = ListData.packPlanData.length;

                        return KreaView(
                          imagepath: ListData.packPlanData[index],
                          index: index,
                        );
                      },
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}

List<Widget> packs() {
  return <Widget>[
    Row(
      children: <Widget>[
        Container(
          height: 100,
          // decoration: BoxDecoration(),
          color: Colors.white,
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.black),
            ),
          ),
        ),
      ],
    )
  ];
}

class KreaView extends StatelessWidget {
  const KreaView({
    Key key,
    this.imagepath,
    this.index,
  }) : super(key: key);
  final int index;
  final String imagepath;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.pushNamed(context, ListData.packPlayerData[index]);
        },
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width - 48,
                  decoration: BoxDecoration(
                    border: new Border(
                      bottom: new BorderSide(
                          color: Colors.black12,
                          width: 2.0,
                          style: BorderStyle.solid),
                    ),
                  ),
                  // decoration: BoxDecoration(),
                  // color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        imagepath,
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Title",
                            style: TextStyle(
                              fontFamily: FitnessAppTheme.fontName,
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              letterSpacing: -0.2,
                              color: FitnessAppTheme.darkerText,
                            ),
                          ),
                          Text(
                            "Day 00",
                            style: TextStyle(
                              fontFamily: FitnessAppTheme.fontName,
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                              letterSpacing: -0.2,
                              color: FitnessAppTheme.darkerText,
                            ),
                          ),
                          Text(
                            "00 minutes",
                            style: TextStyle(
                              fontFamily: FitnessAppTheme.fontName,
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                              letterSpacing: -0.2,
                              color: FitnessAppTheme.darkerText,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
