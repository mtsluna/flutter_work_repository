import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qrreader_app/src/model/qr_model.dart';
import 'package:latlong/latlong.dart';

class MapLaunch extends StatelessWidget {
  const MapLaunch({Key key}) : super(key: key);

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

            },
          )
        ],
      ),
      body: _createStructureMap(qr)
    );
  }

  Widget _createStructureMap(Qr qr) {
    return FlutterMap(
      options: new MapOptions(
        center: qr.getLatLng(),
        zoom: 10
      ),
      layers: [
        _createMap()
      ],
    );
  }

  _createMap() {
    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken': 'pk.eyJ1IjoibXRzbHVuYSIsImEiOiJjanpqeGh6djQwNmVzM2JvOWJraW0ycXBsIn0.Sn4mOlo_tJd87Wbv45rA_w',
        'id': 'mapbox.streets'
      }
    );
  }

}