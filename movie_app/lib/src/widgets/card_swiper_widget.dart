import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {

  final List<dynamic> data;

  CardSwiper({@required this.data});

  @override
  Widget build(BuildContext context) {   

    final _screenSize = MediaQuery.of(context).size;
    final _container = Container(
      padding: EdgeInsets.only(top: 10.0),   
      child: Swiper(
        itemWidth: _screenSize.width * 0.5,
        itemHeight: _screenSize.height * 0.45,   
        itemBuilder: (BuildContext context,int index){
          
          data[index].uniqueId = '${data[index].id}-swiper';
          
          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'detalle',
                arguments: data[index]
              );
            },
            child: Hero(
              tag: data[index].uniqueId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(                
                  image: NetworkImage(data[index].getPosterImg()),
                  placeholder: AssetImage('assets/no-image.jpg'),
                  fit: BoxFit.cover,
                )
              ),
            ),
          );
        },
        itemCount: data.length,
        layout: SwiperLayout.STACK,
        //pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
    );

    return _container;

  }
}