import 'dart:async';

import 'package:qrreader_app/src/model/qr_model.dart';

class Validator{

  final validarGeo = StreamTransformer<List<Qr>, List<Qr>>.fromHandlers(
    handleData: (qr, sink){

      final geoQr = qr.where((qr) => qr.tipo == 'geo').toList();
      sink.add(geoQr);

    }
  );

  final validarHttp = StreamTransformer<List<Qr>, List<Qr>>.fromHandlers(
    handleData: (qr, sink){

      final geoQr = qr.where((qr) => qr.tipo == 'http').toList();
      sink.add(geoQr);
      
    }
  );

}