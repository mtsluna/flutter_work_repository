import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
      ),
      body: ListView(        
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text('Hola, como estas?'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    '00:00am',
                    style: TextStyle(
                      color: Colors.green
                    ),
                  ),              
                ],
              ),
            ),            
          ),
          Card(
            child: ListTile(
              title: Text(
                'Bien y vos?',
                textAlign: TextAlign.right,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    '00:01am',
                    style: TextStyle(
                      color: Colors.green
                    ),
                  ),              
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}