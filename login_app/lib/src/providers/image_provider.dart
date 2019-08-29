import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_app/src/models/image_model.dart';
import 'package:login_app/src/models/product_model.dart';

class ImgurProvider{

  final String _URL = 'https://api.imgur.com/3/upload';

  Future<Imgur> post(String base64) async {

    final response = await http.post(
      _URL,
      headers: {        
        'Authorization': 'Client-ID 6b113fd2384bc03'
      },
      body: {
        'image': '$base64',
        'Content-Type': 'application/json', 
      }
    );

    print(response.toString());

    return new Imgur();

  }

}