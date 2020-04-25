import 'package:flutter/material.dart';
import '../models/info.dart';
import '../fintness_app_theme.dart';

class ArrangePlaylist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        "assets/fitness_app/area1.jpg",
                        fit: BoxFit.fitWidth,
                        height: 200,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).padding.top,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16 - 8.0 * 1.0,
                          bottom: 12 - 8.0 * 1.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: FlatButton(
                              splashColor: Colors.transparent,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: FitnessAppTheme.nearlyBlack,
                                size: 28,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 90),
                                child: Container(
                                  child: Text(
                                    'Package',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22 + 6 - 6 * 1.0,
                                      letterSpacing: 1.2,
                                      color: FitnessAppTheme.white,
                                    ),
                                  ),
                                  decoration: new BoxDecoration(
                                    color: Color.fromRGBO(80, 80, 80, 0.4),
                                    borderRadius: new BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            Container(
              child: ReorderableListDemo(),
              height: MediaQuery.of(context).size.height - 360,
            )
          ],
        ),
        bottomNavigationBar: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Text(
                  "GO!!!",
                  style: new TextStyle(
                    fontSize: 35.0,
                    fontFamily: "Roboto",
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          height: 55,
          decoration: new BoxDecoration(
            color: FitnessAppTheme.nearlyDarkBlue,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}

class ReorderableListDemo extends StatefulWidget {
  const ReorderableListDemo({Key key, this.animationController})
      : super(key: key);

  final AnimationController animationController;
  @override
  _ReorderableListDemoState createState() => _ReorderableListDemoState();
}

class _ReorderableListDemoState extends State<ReorderableListDemo>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;

  List<Widget> listViews = <Widget>[];

  List<String> alphabetList = ListData.alphabetList;

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      onReorder: _onReorder,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children: List.generate(
        alphabetList.length,
        (index) {
          return ListViewCard(
            alphabetList,
            index,
            Key('$index'),
          );
        },
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(
      () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final String item = alphabetList.removeAt(oldIndex);
        alphabetList.insert(newIndex, item);
      },
    );
  }
}

class ListViewCard extends StatefulWidget {
  final int index;
  final Key key;
  final List<String> listItems;

  ListViewCard(this.listItems, this.index, this.key);

  @override
  _ListViewCard createState() => _ListViewCard();
}

class _ListViewCard extends State<ListViewCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/workout");
        },
        splashColor: Colors.blue,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "assets/fitness_app/area1.jpg",
                    height: 100,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Title ${widget.listItems[widget.index]}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          textAlign: TextAlign.left,
                          maxLines: 5,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${widget.listItems[widget.index]}:',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                          textAlign: TextAlign.left,
                          maxLines: 5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(
                Icons.reorder,
                color: Colors.grey,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
