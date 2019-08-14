import 'package:componentes_app/src/pages/alert_page.dart';
import 'package:componentes_app/src/pages/animated_page.dart';
import 'package:componentes_app/src/pages/avatar_page.dart';
import 'package:componentes_app/src/pages/card_page.dart';
import 'package:componentes_app/src/pages/home_page.dart';
import 'package:componentes_app/src/pages/input_page.dart';
import 'package:componentes_app/src/pages/listview_page.dart';
import 'package:componentes_app/src/pages/message_page.dart';
import 'package:componentes_app/src/pages/slider_page.dart';
import 'package:flutter/material.dart';



Map<String, WidgetBuilder> getApplicationRoutes(){

  return <String, WidgetBuilder>{
    '/': (BuildContext c) => HomePage(),
    'alert': (BuildContext c) => AlertPage(),
    'avatar': (BuildContext c) => AvatarPage(),
    'card': (BuildContext c) => CardPage(),
    'animatedContainer': (BuildContext c) => AnimatedPage(),
    'inputs': (BuildContext c) => InputPage(),
    'messages': (BuildContext c) => MessagePage(),
    'sliders': (BuildContext c) => SliderPage(),
    'list': (BuildContext c) => ListViewPage()
  
  };

}
        