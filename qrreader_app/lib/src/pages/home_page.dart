import 'package:flutter/material.dart';
import 'package:qrreader_app/src/pages/directions_page.dart';
import 'package:qrreader_app/src/pages/map_page.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  
  int currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("QR Scanner"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: (){
                
              },
            )
          ],
        ),
        body: _chargePage(currentIndex),
        bottomNavigationBar: _createBottomNavigationBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(          
          child: Icon(Icons.filter_center_focus),
          onPressed: (){

          },
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
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