import 'package:myfitnessapp/fitness_app/models/tabIcon_data.dart';
import 'package:myfitnessapp/fitness_app/traning/package_screen.dart';
import 'package:flutter/material.dart';
import 'fintness_app_theme.dart';

class PackageView extends StatefulWidget {
  @override
  _PackageViewState createState() => _PackageViewState();
}

Widget tabBody = Container(
  color: FintnessAppTheme.background,
);
AnimationController animationController;

class _PackageViewState extends State<PackageView>
    with TickerProviderStateMixin {
  AnimationController animationController;

  // List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  @override
  void initState() {
    // tabIconsList.forEach((TabIconData tab) {
    // tab.isSelected = false;
    // });
    // tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    tabBody = PackageScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FintnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }
}

Widget bottomBar() {
  return Column(
    children: <Widget>[
      const Expanded(
        child: SizedBox(),
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 55),
              child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    "START",
                    style: new TextStyle(
                      fontSize: 50.0,
                      fontFamily: "Roboto",
                    ),
                  ),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(10),
                  color: FintnessAppTheme.nearlyDarkBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    ],
  );
}
