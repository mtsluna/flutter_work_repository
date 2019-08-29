import 'package:flutter/material.dart';

bool isNumeric(String s){
  
  if(s.isEmpty) return false;
  final n = num.tryParse(s);
  return (n == null) ? false : true;

}

void viewSnackbar(GlobalKey<ScaffoldState> key, String message){
    final snackbar = SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 1500),
    );

    key.currentState.showSnackBar(snackbar);

  }