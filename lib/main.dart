import 'package:flutter/material.dart';
import 'package:flutter_app/more.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Tutorial',
    home: TutorialHome(),
  ));
}


class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: Container(
            color: Colors.grey[100],
            child: TabBar(
                tabs: [
                  Container(height: 60, child: Tab(icon: Icon(Icons.home, size: 35))),
                  Container(height: 60, child: Tab(icon: Icon(Icons.search, size: 35))),
                  Container(height: 60, child: Tab(icon: Icon(Icons.location_on, size: 35))),
                  Container(height: 60, child: Tab(icon: Icon(Icons.person, size: 35))),
                ],
                unselectedLabelColor: Colors.indigo[100],
                labelColor: Colors.indigo[800],
                indicatorColor: Colors.transparent
            ),
          ),
          body: TabBarView(
            children: [
              ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 40, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Hai, Ulul!', textScaleFactor: 1, style: TextStyle(color: Colors.grey[400]),),
                        CircleAvatar(
                          backgroundImage: ExactAssetImage('assets/1.PNG'),
                          minRadius: 20,
                          maxRadius: 20,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10, right: 20),
                    child: Text('Mau \nLiburan \nKemana, bos?', textScaleFactor: 2.4, style: TextStyle(color: Color.fromRGBO(19, 33, 70, 1), fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: InnerTab(),
                  ),
                ],
              ),
              Center(child: Text("2"),),
              Center(child: Text("3"),),
              Center(child: Text("4"),)
            ],
          ),
        )
    );
  }
}

class InnerTab extends StatelessWidget {

  final List<String> titles = ["Bali", "Bukittinggi", "Yogyakarta", "Bogor", "Bandung", "Malang"];
  final List<double> stars = [4, 3, 5, 5, 4, 5];
  final List<String> images = ["assets/3.PNG", "assets/2.PNG", "assets/3.PNG", "assets/2.PNG", "assets/2.PNG", "assets/3.PNG"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
              Container(height: 30, child: Tab(text: "Indonesia")),
              Container(height: 30, child: Tab(text: "Jepang",)),
              Container(height: 30, child: Tab(text: "Amerika",)),
              Container(height: 30, child: Tab(text: "Afrika",)),
            ],
          ),
          Container(
            height: 355,
            margin: EdgeInsets.only(left: 20, top: 15, right: 20),
            child: TabBarView(
                children: [
                  ListView.builder
                    (
                      itemCount: 6,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Transform.translate(
                          offset: Offset(0, -24),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => More(title: titles[index], rating: stars[index], image: images[index],)),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: TravelCard(title: titles[index], rating: stars[index], images: images[index],),
                            ),
                          ),
                        );
                      }
                  ),
                  Center(child: Text("2"),),
                  Center(child: Text("3"),),
                  Center(child: Text("4"),)
                ]
            ),
          )
        ],
      ),
    );
  }
}

class TravelCard extends StatelessWidget {

  final double rating;
  final String title, images;

  TravelCard({
    this.rating,
    this.title,
    this.images
  });

  @override
  Widget build(BuildContext context) {

    double r = rating;

    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(247, 247, 249, 1),
          borderRadius: BorderRadius.all(Radius.circular(14))
      ),
      child: SizedBox(
        height: 80,
        child: Container(
          child: Row(
            children: <Widget>[
              SizedBox(
                  height: 80,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(14.0),
                    child: Image.asset(images),
                  )
              ),
              SizedBox(
                height: 80,
                child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10, top: 12),
                          child: Text(title, textScaleFactor: 1, style: TextStyle(color: Color.fromRGBO(19, 33, 70, 1), fontWeight: FontWeight.bold, ),),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 10, top: 4),
                            child: Row(
                              children: <Widget>[
                                SmoothStarRating(
                                    allowHalfRating: false,
                                    onRatingChanged: (v) {
                                      r = v;
                                    },
                                    starCount: 5,
                                    rating: rating,
                                    size: 10.0,
                                    color: Colors.orange,
                                    borderColor: Colors.orange,
                                    spacing:0.0
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 4),
                                  child: Text(rating.toInt().toString(), textScaleFactor: 0.8, style: TextStyle(color: Colors.orange),),
                                )
                              ],
                            )
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, top: 4),
                          child: Text("Kota Denpasar merupakan \nkota terbesar kedua di willayah..", textScaleFactor: 0.7, style: TextStyle(color: Colors.grey),),
                        )
                      ],
                    )
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

}

// Circle tab indicator
class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius}) : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
    ..color = color
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset = offset + Offset(cfg.size.width / 2, cfg.size.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
// Circle tab indicator END