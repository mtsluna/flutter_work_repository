import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login_app/src/models/product_model.dart';
import 'package:login_app/src/providers/product_provider.dart';
import 'package:login_app/src/utils/utils.dart' as utils;

class ProductPage extends StatefulWidget {
  
  static final routeName = "product";

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  
  final formKey = GlobalKey<FormState>();
  final scafoldKey = GlobalKey<ScaffoldState>();
  Product product = new Product();
  final ProductProvider productProvider = new ProductProvider();
  bool _saving = false;
  File photo;
  String base64 = "";

  @override
  Widget build(BuildContext context) {

    final Product prodData = ModalRoute.of(context).settings.arguments;

    if(prodData != null){
      product = prodData;
    }

    return Scaffold(
      key: scafoldKey,
      appBar: AppBar(
        title: Text('Product'),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              _createName(),
              _createPrice(),
              _createAvailable(),
              Divider(),
              SizedBox(
                width: double.infinity,
                child: _saveButton(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createName() {
    return TextFormField(
      initialValue: product.name,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Product',
      ),
      onSaved: (value) => product.name = value,
      validator: (value){
        if(value.length < 3){
          return 'Must have more than 3 characters.';
        }
        else{
          return null;
        }
      },
    );
  }

  Widget _createPrice() {
    return TextFormField(
      initialValue: product.price.toString(),
      keyboardType: TextInputType.numberWithOptions(
        decimal: true
      ),
      decoration: InputDecoration(
        labelText: 'Price'
      ),
      onSaved: (value) => product.price = double.parse(value),
      validator: (value){
        if(!utils.isNumeric(value)){
          return 'Must be a number.';
        }
        else{
          return null;
        }
      },
    );
  }

  Widget _saveButton(BuildContext context) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),      
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      label: Text('Save'),
      icon: Icon(Icons.save),
      onPressed: (_saving) ? null : _submit,
    );
  }

  void _submit() async {

    if(formKey.currentState.validate()){
      formKey.currentState.save();
      
      setState(() {
        _saving = true;
      });

      if(product.id == null){
        try {
          productProvider.post(product);
          utils.viewSnackbar(scafoldKey, 'Created');
        } catch (e) {
          utils.viewSnackbar(scafoldKey, 'Try again later');
        }        
      }
      else{
        try {
          productProvider.put(product);
          utils.viewSnackbar(scafoldKey, 'Updated');
        } catch (e) {
          utils.viewSnackbar(scafoldKey, 'Try again later');
        }        
      }

      Navigator.pop(context);      

    } else {
      return;
    }   

  }

  Widget _createAvailable() {
    return SwitchListTile(
      value: product.available,
      title: Text('Available'),
      onChanged: (value){
        setState(() {
          product.available = value;
        });
      },
    );
  }
}