import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  
  double _valorSlider = 0.0;
  bool _bloquearCheck = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            Divider(),
            _checkBox(),
            Divider(),
            Expanded(
              child: _crearImagen()
              )
          ],
        )
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      onChanged: (value){

        if(!_bloquearCheck){
          setState(() {
            _valorSlider = value;
          });
        }
        
      },
      min: 0.0,
      value: _valorSlider,
      max: 400.0,
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://pbs.twimg.com/media/Du3rSm1U8AMlVWH.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain
    );
  }

    Widget _checkBox() {
      return CheckboxListTile(
        onChanged: (value){

          setState(() {
            _bloquearCheck = value;
          });

        },
        value: _bloquearCheck,
        title: Text('¿Desea bloquear el slider?'),
        subtitle: Text('Cuando esta checkeado estara desactivado\nCuando no esta checkeado estara activo'),
      ); 
  }
}