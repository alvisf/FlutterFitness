import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myfitnessapp/fitness_app/fintness_app_theme.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new WorkOut(),
  ));
}

class WorkOut extends StatefulWidget {
  @override
  WorkOutState createState() => new WorkOutState();
}

class WorkOutState extends State<WorkOut> {
  bool _loading;
  double _progressValue;

  @override
  void initState() {
    super.initState();
    _loading = false;
    _progressValue = 0.3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                LinearProgressIndicator(
                  value: _progressValue,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      FintnessAppTheme.nearlyDarkBlue),
                  backgroundColor: Color.fromRGBO(80, 80, 80, 0.05),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: FintnessAppTheme.grey,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height - 300,
                // ),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Image.asset(
                        "assets/fitness_app/area1.gif",
                        fit: BoxFit.fitWidth,
                        height: 200,
                      )),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "GO!!!",
                      style: new TextStyle(
                        fontSize: 40.0,
                        fontFamily: "Roboto",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "x 00",
                      style: new TextStyle(
                        fontSize: 40.0,
                        fontFamily: "Roboto",
                        color: FintnessAppTheme.nearlyDarkBlue,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: FintnessAppTheme.grey,
                        size: 100,
                      ),
                    ),
                    Container(
                      child: SizedBox(
                        height: 200.0,
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Container(
                                width: 150,
                                height: 150,
                                child: new CircularProgressIndicator(
                                  strokeWidth: 7,
                                  value: 0.7,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      FintnessAppTheme.nearlyDarkBlue),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: FlatButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.pause,
                                    color: FintnessAppTheme.grey,
                                    size: 100,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FlatButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: FintnessAppTheme.grey,
                        size: 100,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _loading = !_loading;
      //       _updateProgress();
      //     });
      //   },
      //   tooltip: 'Download',
      //   child: Icon(Icons.cloud_download),
      // ),
    );
  }

  // we use this function to simulate a download
  // by updating the progress value
  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    new Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.2;
        // we "finish" downloading here
        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          _progressValue = 0.0;
          return;
        }
      });
    });
  }
}
