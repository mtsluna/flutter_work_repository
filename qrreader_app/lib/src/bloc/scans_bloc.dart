import 'dart:async';

import 'package:qrreader_app/src/model/qr_model.dart';
import 'package:qrreader_app/src/providers/db_provider.dart';

class ScansBloc{

  static final ScansBloc _singleton = new ScansBloc._internal();
  final _scansController = StreamController<List<Qr>>.broadcast();

  factory ScansBloc(){
    return _singleton;
  }

  ScansBloc._internal(){
    getAll();
  }

  Stream<List<Qr>> get scansStream => _scansController.stream;

  dispose(){
    _scansController?.close();
  }

  getAll() async {
    _scansController.sink.add(await DBProvider.db.findAll());
  }

  save(Qr qr) async{
    await DBProvider.db.save(qr);
    getAll();
  }

  delete(int id) async{
    await DBProvider.db.delete(id);
    getAll();
  }

  deleteAll() async{
    await DBProvider.db.deleteAll();
    getAll();
  }
  
}