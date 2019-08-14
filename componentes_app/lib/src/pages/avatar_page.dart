import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            padding: EdgeInsets.all(2.0),
            child: CircleAvatar(
              child: Text("SL"),
              backgroundImage: NetworkImage(
                "https://img.ecartelera.com/noticias/40000/40053-c.jpg"
              ),
              radius: 28.0,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage("https://img.ecartelera.com/noticias/40000/40053-c.jpg"),
          placeholder: AssetImage('data/loading.gif'),
          fadeInDuration: Duration(microseconds: 200),
        ),
      ),
    );
  }

}