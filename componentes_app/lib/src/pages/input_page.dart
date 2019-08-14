import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = "";
  String _email = "";
  String _fecha = "";
  String _opcionSeleccionada = "Mendoza";
  List<String> _provincias = ['Mendoza', 'San Juan', 'San Luis', 'Buenos Aires'];

  TextEditingController _inputField = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs de texto"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {

    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        counter: Text("Letras ${_nombre.length}"),
        hintText: "Nombre de la persona",
        labelText: "Nombre",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (value){

        setState(() {
          _nombre = value;
        });

      },
    );
  }

  Widget _crearPersona(){
    return ListTile(
      title: Text('Nombre: $_nombre'),
      subtitle: Text('E-mail: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }

  Widget _crearEmail() {

    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "E-mail de la persona",
        labelText: "E-mail",
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (value){

        setState(() {
          _email = value;
        });

      },
    );

  }

  Widget _crearPassword() {

    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Su password",
        labelText: "Password",
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock_outline)
      ),
      onChanged: (value){

        setState(() {
          _email = value;
        });

      },
    );

  }

  _crearFecha() {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputField,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Su fecha de nacimiento",
        labelText: "Fecha de nacimiento",
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);

      },
    );

  }

  _selectDate(BuildContext context) async{

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025)
    );

    if (picked != null){
      setState(() {
        _fecha = picked.toString().substring(0,10);
        _inputField.text = _fecha;
      });
    }

  }

  List<DropdownMenuItem<String>> _getItems(){
    
    List<DropdownMenuItem<String>> lista = new List();

    _provincias.forEach((provincia){
      lista.add(new DropdownMenuItem(
        value: provincia,
        child: Text(provincia),
      ));
    });

    return lista;

  }

  Widget _crearDropdown() {

    return Row(
      children: <Widget>[
        Icon(Icons.location_searching),
        SizedBox(
          width: 30.0
        ),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: _getItems(),
            onChanged: (data){
              setState(() {
              _opcionSeleccionada = data; 
              });
            },
          ),
        )
      ],
    );

  }

}