import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/main.dart';

class More extends StatelessWidget {

  String title, image;
  double rating;

  More ({
    this.title,
    this.image,
    this.rating
  });

  @override
  Widget build(BuildContext context) {
    return MainContainer(title: title, rating: rating, image: image,);
  }

}

class MainContainer extends StatelessWidget {

  final String title, image;
  final double rating;

  MainContainer ({
    this.title,
    this.image,
    this.rating
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Container(
                width: double.infinity,
                color: Color.fromRGBO(247, 247, 249, 1),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0)
                      ),
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      )
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 30, top: 40),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.0)
                          ),
                          child: RawMaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: new Icon(
                              Icons.arrow_back,
                              color: Color.fromRGBO(57,182,245, 1),
                              size: 30.0,
                            ),
                            shape: new CircleBorder(),
                            elevation: 2.0,
                            fillColor: Colors.white,
                            padding: const EdgeInsets.all(5.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(247, 247, 249, 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0)
                    )
                ),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 40, top: 20),
                        child: Text(title, textScaleFactor: 2, style: TextStyle(color: Color.fromRGBO(19, 33, 70, 1), fontWeight: FontWeight.bold, ),),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 40, top: 15, right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.star, color: Colors.orange,),
                                Container(margin: EdgeInsets.only(left: 5), child: Text(rating.toString(), textScaleFactor: 1.2, style: TextStyle(color: Colors.orange),),)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.cloud, color: Colors.indigo[100],),
                                Container(margin: EdgeInsets.only(left: 5), child: Text("25 ℃", textScaleFactor: 1.2, style: TextStyle(color: Colors.indigo[100]),),)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.airplanemode_active, color: Colors.indigo[100],),
                                Container(margin: EdgeInsets.only(left: 5), child: Text("2 jam", textScaleFactor: 1.2, style: TextStyle(color: Colors.indigo[100]),),)
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: CircleTabIndicator(color: Color.fromRGBO(57,182,245, 1), radius: 2),
                        unselectedLabelColor: Colors.indigo[100],
                        labelColor: Color.fromRGBO(57,182,245, 1),
                        indicatorColor: Colors.transparent,
                        labelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        tabs: [
                          Container(height: 30, child: Tab(text: "City 1")),
                          Container(height: 30, child: Tab(text: "City 2",)),
                        ],
                      ),
                      Container(
                        constraints: BoxConstraints(minHeight: 100, minWidth: 100),
                        height: 142,
                        margin: EdgeInsets.only(left: 20, top: 15, right: 20),
                        child: TabBarView(
                            children: [
                              Center(child: Text("Text Description"),),
                              Center(child: Text("Text Description"),)
                            ]
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.indigo[800],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0)
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 30, top: 20),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Kisaran karga", style: TextStyle(color: Colors.indigo[100]),),
                        Text("Rp 1.100.000", textScaleFactor: 1.4, style: TextStyle(color: Colors.white),)
                      ],
                    ),),
                    Container(
                      padding: EdgeInsets.only(top: 15, right: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(222, 241, 255, 1),
                                borderRadius: BorderRadius.all(Radius.circular(14))
                            ),
                            child: FlatButton(
                              onPressed: () {},
                              child: Text("Lanjutkan", textScaleFactor: 1.4, style: TextStyle(color: Color.fromRGBO(57,182,245, 1)),),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}