import 'package:flutter/material.dart';

class EventInfoPage extends StatefulWidget {
  @override
  EventInfoPageState createState() => EventInfoPageState();
}

class EventInfoPageState extends State<EventInfoPage> {
  @override
  Widget build(BuildContext context) {
    final Color main = Color(0xFFb80c09);
    final Color background = Color(0xFFFFFFFF);
    final Color alert = Color(0xFFEF798A);
    final Color font = Color(0xFF000000);
    final Color success = Color(0xFF93FF96);

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Гыгэ не буит",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.network(
                    "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20),
              color: Color(0xFFE0E0E0),
              child: Container(
                padding: EdgeInsets.only(top: 30, right: 20, left: 20),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.access_time),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                            ),
                            Text('23.11.2001, 19:00')
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.location_on),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                            ),
                            Text('Бульвар Яна Райниса д. 31')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
