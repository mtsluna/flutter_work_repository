import 'dart:async';

import 'package:login_app/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators{

  final _emailController = BehaviorSubject<String>();
  final _passwController = BehaviorSubject<String>();

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwController.sink.add;

  Stream<String> get emailStream => _emailController.stream.transform(validateEmail);
  Stream<String> get passwordStream => _passwController.stream.transform(validatePassword);

  Stream<bool> get formValidStream => 
      Observable.combineLatest2(emailStream, passwordStream, (e, p) => true);

  String get email => _emailController.value;
  String get passw => _passwController.value;

  dispose(){
    _emailController?.close();
    _passwController?.close();
  }

}