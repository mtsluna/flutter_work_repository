import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qrreader_app/src/bloc/scans_bloc.dart';
import 'package:qrreader_app/src/model/qr_model.dart';

class MapLaunch extends StatefulWidget {

  @override
  _MapLaunchState createState() => _MapLaunchState();
}

class _MapLaunchState extends State<MapLaunch> {

  MapController mapController = new MapController();
  double zoom = 15;
  String map = "streets";

  @override
  Widget build(BuildContext context) {

    final Qr qr = ModalRoute.of(context).settings.arguments;
    

    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: (){
              mapController.move(qr.getLatLng(), zoom);
            },
          )
        ],
      ),
      body: _createStructureMap(qr, context)
    );
  }

  Widget _createStructureMap(Qr qr, BuildContext context) {
    return Stack(
      children: <Widget>[
        FlutterMap(
          mapController: mapController,
          options: new MapOptions(
            center: qr.getLatLng(),
            zoom: zoom
          ),
          layers: [
            _createMap(),
            _createPoints(qr)
          ],
        ),
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(width: 10.0,),
              _zoomButton(context, Icons.zoom_in, () => {
                setState(() {
                  if(zoom < 18){
                    zoom++;
                    mapController.move(mapController.center, zoom);
                  } 
                })
              }),
              SizedBox(width: 20.0,),
              _zoomButton(context, Icons.zoom_out, () => {
                setState(() {
                  if(zoom > 2){
                    zoom--;
                    mapController.move(mapController.center, zoom);
                  } 
                })
              }),
              SizedBox(width: 20.0,),
              _mapType(context, Icons.repeat, (){
                switch(map){
                  case "streets":
                    map = "dark";
                    break;
                  case "dark":
                    map = "light";
                    break;
                  case "light":
                    map = "outdoors";
                    break;
                  case "outdoors":
                    map = "satellite";
                    break;
                  case "satellite":
                    map = "streets";
                    break;
                  //streets, dark, light, outdoors, satellite
                }

                setState(() {});
              }),
              SizedBox(width: 10.0,),
            ],
          ),
        ),        
      ]
    );
  }

  _createMap() {
    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken': 'pk.eyJ1IjoibXRzbHVuYSIsImEiOiJjanpqeGh6djQwNmVzM2JvOWJraW0ycXBsIn0.Sn4mOlo_tJd87Wbv45rA_w',
        'id': 'mapbox.$map'
        //streets, dark, light, outdoors, satellite
      }
    );
  }

  _createPoints(Qr qr) {
    return MarkerLayerOptions(
      markers: <Marker>[
        Marker(
          width: 100.0,
          height: 100.0,
          point: qr.getLatLng(),
          builder: (context) => Container(
            child: Icon(
              Icons.location_on,
              size: 60.0,
              color: Theme.of(context).primaryColor,
            ),
          )
        )
      ]
    );
  }

  _zoomButton(BuildContext context, IconData icon, Function action){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Theme.of(context).primaryColor, 
      ),                
      child: IconButton(          
        color: Colors.white,
        icon: Icon(icon),
        onPressed: action,
      ),
    );
  }

  _mapType(BuildContext context, IconData icon, Function action){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Theme.of(context).primaryColor, 
      ),
      child: IconButton(          
        color: Colors.white,
        icon: Icon(icon),
        onPressed: action,
      ),
    );
  }

}