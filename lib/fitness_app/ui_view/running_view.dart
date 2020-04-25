import 'package:flutter/material.dart';
import '../fintness_app_theme.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class RunningView extends StatefulWidget {
  final AnimationController animationController;
  final Animation animation;

  const RunningView({Key key, this.animationController, this.animation})
      : super(key: key);

  @override
  _RunningViewState createState() => _RunningViewState();
}

class _RunningViewState extends State<RunningView> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  // TextEditingController _eventController;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    // _eventController = TextEditingController();
    _events = {};
    initPrefs();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
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
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 0, bottom: 0),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FitnessAppTheme.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                                topRight: Radius.circular(8.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: FitnessAppTheme.grey.withOpacity(0.4),
                                  offset: Offset(1.1, 1.1),
                                  blurRadius: 10.0),
                            ],
                          ),
                          child: Row(
                            // alignment: Alignment.topLeft,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                child: SizedBox(
                                  height: 74,
                                  child: AspectRatio(
                                    aspectRatio: 1.714,
                                    child: Image.asset(
                                        "assets/fitness_app/back.png"),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TableCalendar(
                                  events: _events,
                                  initialCalendarFormat: CalendarFormat.week,
                                  headerVisible: false,
                                  calendarStyle: CalendarStyle(
                                    selectedColor: Colors.transparent,
                                    todayColor: Colors.transparent,
                                    markersColor: Colors.green,
                                    selectedStyle:
                                        TextStyle(color: Colors.black),
                                    todayStyle: TextStyle(color: Colors.black),
                                  ),
                                  calendarController: _controller,
                                  // onDayLongPressed: _showAddDialog(),

                                  onDaySelected: (date, events) {
                                    setState(() {
                                      // _selectedEvents = events;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -16,
                        left: 0,
                        child: SizedBox(
                          width: 110,
                          height: 110,
                          child: Image.asset("assets/fitness_app/runner.png"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _showAddDialog() {
    setState(() {
      if (_events[_controller.selectedDay] != null) {
        _events[_controller.selectedDay].add("_eventController.text");
      } else {
        _events[_controller.selectedDay] = ["_eventController.text"];
      }
      prefs.setString("events", json.encode(encodeMap(_events)));
    });
  }
}
