import 'package:flutter/material.dart';
import 'package:login_app/src/blocs/login_bloc.dart';
import 'package:login_app/src/blocs/product_bloc.dart';

class Provider extends InheritedWidget{

  static Provider _instance;
  final loginBloc = LoginBloc();
  final _productBloc = ProductBloc();

  factory Provider({Key key, Widget child}){
    if(_instance == null){
      _instance = new Provider._internal(key: key, child: child,);
    }

    return _instance;

  }

  Provider._internal({Key key, Widget child})
    :super(key: key, child: child);
  

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of (BuildContext context){

    return (context.inheritFromWidgetOfExactType(Provider) as Provider).loginBloc;

  }

  static ProductBloc productosBloc (BuildContext context){

    return (context.inheritFromWidgetOfExactType(Provider) as Provider)._productBloc;

  }

}