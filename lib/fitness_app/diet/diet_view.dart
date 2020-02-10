import 'package:flutter/material.dart';
import 'package:myfitnessapp/fitness_app/models/info.dart';

import '../fintness_app_theme.dart';

class DietView extends StatefulWidget {
  const DietView(
      {Key key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation<dynamic> mainScreenAnimation;
  @override
  _DietViewState createState() => _DietViewState();
}

class _DietViewState extends State<DietView> with TickerProviderStateMixin {
  AnimationController animationController;
  final ScrollController scrollController1 = ScrollController();

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
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
            child: AspectRatio(
              aspectRatio: 0.609,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: GridView(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 0, bottom: 0),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: List<Widget>.generate(
                    ListData.packListData.length,
                    (int index) {
                      final int count = ListData.packListData.length;
                      final Animation<double> animation =
                          Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: animationController,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn),
                        ),
                      );
                      animationController.forward();
                      return AreaView(
                        imagepath: ListData.packListData[index],
                        index: index,
                        animation: animation,
                        animationController: animationController,
                      );
                    },
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 24.0,
                    crossAxisSpacing: 24.0,
                    childAspectRatio: 3.0,
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

class AreaView extends StatelessWidget {
  const AreaView({
    Key key,
    this.imagepath,
    this.index,
    this.animationController,
    this.animation,
  }) : super(key: key);
  final int index;
  final String imagepath;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: FintnessAppTheme.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: FintnessAppTheme.grey.withOpacity(0.4),
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 10.0),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  splashColor: FintnessAppTheme.nearlyDarkBlue.withOpacity(0.2),
                  onTap: () {
                    Navigator.pushNamed(context, ListData.infoListData[index]);
                  },
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 0, left: 0, right: 0),
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(8.0),
                          child: Container(
                            child: AspectRatio(
                              aspectRatio: 3.0,
                              child: Image(
                                image: AssetImage(imagepath),
                                fit: BoxFit.fill, // use this
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
