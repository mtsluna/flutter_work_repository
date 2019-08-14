import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {

  final titleStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold
  );

  final subtitleStyle = TextStyle(
    fontSize: 16.0,
    color: Colors.grey
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _createImage(),
            _createRow(),
            SizedBox(height: 20.0),
            _createButtons(),
            SizedBox(height: 20.0,),
            _createText(),
            _createText(),
            _createText(),
            _createText(),
            _createText(),
            _createText(),
            _createText(),
            _createText(),
            _createText(),
          ],
        ),
      )
    );
  }

  Widget _createImage(){
    return Container(
      width: double.infinity,
      child: Image(
        image: NetworkImage("https://data2.1freewallpapers.com/download/bicycle-cyclist-sportsman-1280x720.jpg"),
        fit: BoxFit.cover
      ),
    );
  }

  Widget _createRow(){
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Ciclismo de montaña",
                    style: titleStyle,              
                  ),
                  SizedBox(
                    height: 7.0
                  ),
                  Text(
                    "Vivi la apasionante aventura.",
                    style: subtitleStyle,
                  )
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
              size: 30.0
            ),
            Text(
              "41",
              style: TextStyle(
                fontSize: 20.0
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createButtons() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _createButton(Icons.call, 'CALL'),
          _createButton(Icons.near_me, 'ROUTE'),
          _createButton(Icons.share, "SHARE"),
        ],
      )
    );
  }

  Widget _createButton(IconData icon, String text){
    return SafeArea(
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(
              icon,
              color: Colors.blue,
              size: 40.0,
            ),
            onPressed: (){

            },
          ),
          SizedBox(height: 5.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.blue
            )
          )
        ],
      ),
    );
  }

  Widget _createText() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Text(
          "Eu esse Lorem fugiat in velit ut id magna esse deserunt sint ex. Quis dolor non aliqua excepteur irure labore est qui deserunt ut. Dolor tempor esse aliqua incididunt cupidatat. Laboris aliquip exercitation laborum sunt reprehenderit enim officia id ullamco magna. Minim proident labore eiusmod enim elit excepteur deserunt incididunt cupidatat aute quis excepteur eiusmod officia.",
          textAlign: TextAlign.justify,        
        ),
      ),
    );    
  }

}