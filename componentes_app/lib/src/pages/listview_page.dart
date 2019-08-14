import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  
  ScrollController sController = ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimo = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _agregar10();

    sController.addListener((){
      
      if(sController.position.pixels == sController.position.maxScrollExtent){
        
        _fetchData();

      }

    });    

  }  

  @override
  void dispose() {
    super.dispose();
    sController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      )
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: reObtener,
      child: ListView.builder(
        controller: sController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext c, int pos){
          
          final imagen = _listaNumeros[pos];
          
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            placeholder: AssetImage('data/loading.gif'),
          );
        },
      ),
    );
  }

  void _agregar10(){
    for(var i = 0; i <= 10; i++){
      _ultimo++;
      _listaNumeros.add(_ultimo);
    }

    setState(() {
      
    });

  }

  Future _fetchData() async{

    _isLoading = true;

    setState(() {
      
    });

    new Timer(new Duration(seconds: 2), _respuestaHTTP);

  }

  void _respuestaHTTP() {
    
    _isLoading = false;
    sController.animateTo(
      sController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    _agregar10();

  }

  Widget _crearLoading() {
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    }
    else{
      return Container();
    }
  }

  Future<Null> reObtener() async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){

      _listaNumeros.clear();
      _ultimo++;
      _agregar10();

    });

    return Future.delayed(duration);

  }

}