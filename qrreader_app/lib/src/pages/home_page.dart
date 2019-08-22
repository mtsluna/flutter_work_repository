import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:qrreader_app/src/bloc/scans_bloc.dart';
import 'package:qrreader_app/src/model/qr_model.dart';
import 'package:qrreader_app/src/pages/directions_page.dart';
import 'package:qrreader_app/src/pages/map_page.dart';
import 'package:qrreader_app/src/utils/utils.dart' as utils;

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  
  int currentIndex = 0;
  final _scansBloc = new ScansBloc();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("QR Scanner"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: _scansBloc.deleteAll,
            )
          ],
        ),
        body: _chargePage(currentIndex),
        bottomNavigationBar: _createBottomNavigationBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(          
          child: Icon(Icons.filter_center_focus),
          onPressed: _scanQR,
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  _scanQR() async{

    String futureString;
    
    try {

      futureString = await new QRCodeReader().scan();

    } catch (e) {

      futureString = null;

    }

    if(futureString != null){
      Qr qr = Qr(
        valor: futureString
      );

      _scansBloc.save(qr);

      if (Platform.isIOS){
        Future.delayed(Duration(milliseconds: 750), (){
          utils.launchURL(context, qr);
        });
      }
      else{
        utils.launchURL(context, qr);
      }          
    }
  }

  Widget _createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        setState(() {
          currentIndex = index;
        });        
      },
      items: [
        _createNavigationBarItems(Icons.map, "Mapas"),
        _createNavigationBarItems(Icons.directions, "Direcciones")
      ],
    );
  }

  BottomNavigationBarItem _createNavigationBarItems(IconData icon, String text){
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: Text(text)      
    );
  }

  Widget _chargePage(int page) {

    switch (page){
      case 0:
        return MapPage();
        break;
      case 1:
        return DirectionsPage();
        break;
      default:
        return HomePage();
        break;
    }

  }
}