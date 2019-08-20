import 'package:flutter/material.dart';
import 'package:qrreader_app/src/bloc/scans_bloc.dart';
import 'package:qrreader_app/src/model/qr_model.dart';
import 'package:qrreader_app/src/utils/utils.dart' as utils;

class MapPage extends StatelessWidget {
 
  MapPage(){
    _scansBloc.getAll();
  }

  final _scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Qr>>(
      stream: _scansBloc.scansStream,
      builder: (BuildContext context, AsyncSnapshot<List<Qr>> snapshot) {
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        
        if(snapshot.data.length == 0){
          return Center(
            child: Text(
              "No data..."
            ),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) => Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.redAccent,
            ),
            onDismissed: (direction){
              _scansBloc.delete(snapshot.data[index].id);
            },
            child: ListTile(
              leading: Icon(
                Icons.cloud_queue,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(snapshot.data[index].valor),
              subtitle: Text(snapshot.data[index].id.toString()),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
              onTap: (){
                utils.launchURL(context, snapshot.data[index]);
              },
            ),
          ),
        );

      },
    );
  }

}