import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
 
  final _backgroundStyle = Color.fromRGBO(108, 192, 218, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            _page1(),
            _page2()
          ],
        )
      ),
    );
  }

  Widget _page1() {
    return Stack(
      children: <Widget>[
        _colorBackground(),
        _imageBackground(),
        _createTexto()
      ],
    );
  }

  Widget _page2() {
    return Stack(
      children: <Widget>[
        _colorBackground(),
        _createButton()
      ],
    );
  }

  Widget _colorBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: _backgroundStyle
      ),
    );
  }

  Widget _imageBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/background.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _createTexto() {

    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 50.0
    );

    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Text(
              "11º",
              style: textStyle
            ),
            Text(
              "Miércoles",
              style: textStyle
            ),
            Expanded(
              child: SizedBox(),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 70.0,
              color: Colors.white
            )
          ],
        ),
      ),
    );
  }

  Widget _createButton() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: _backgroundStyle,
      child: Center(
        child: RaisedButton(
          shape: StadiumBorder(),
          color: Colors.blueAccent,
          textColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 20.0
            ),
            child: Text(
              "Bienvenidos",
              style: TextStyle(
                fontSize: 20.0
              ),
            ),
          ),
          onPressed: (){

          },
        ),
      ),
    );
  }

}