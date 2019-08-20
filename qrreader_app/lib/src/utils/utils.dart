import 'package:qrreader_app/src/model/qr_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

launchURL(BuildContext context, Qr qr) async{

  if(qr.tipo == 'http'){
    if(await canLaunch(qr.valor)){
      await launch(qr.valor);
    }
    else{
      throw 'No se pudo lanzar la url: \'${qr.valor}\'';
    }
  }
  else{
    Navigator.pushNamed(context, 'mapLaunch', arguments: qr);
  }

  
}