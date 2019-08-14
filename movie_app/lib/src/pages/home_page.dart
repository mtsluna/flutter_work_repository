import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movie_app/src/models/movie_model.dart';
import 'package:movie_app/src/providers/movie_provider.dart';
import 'package:movie_app/src/providers/movie_provider.dart' as prefix0;
import 'package:movie_app/src/search/search_delegate.dart';
import 'package:movie_app/src/widgets/card_swiper_widget.dart';
import 'package:movie_app/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {

  final movieProvider = new MovieProvider();

  @override
  Widget build(BuildContext context) {

    movieProvider.getPopulares();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Peliculas en cines'),
        backgroundColor: Colors.indigoAccent,        
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(
                context: context,
                delegate: DataSearch(),
                query: ''
              );
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context)
          ],
        ),
      )
    );
  }
   
  Widget _footer(BuildContext ct){
    return Container(
      width: double.infinity,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'Populares',
            style: Theme.of(ct).textTheme.subhead,

          ),
        ),
        SizedBox(height: 5.0),
        StreamBuilder(
          stream: movieProvider.popularesStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            
            if(snapshot.hasData){
              return MovieHorizontal(
                movies: snapshot.data,
                siguientePagina: movieProvider.getPopulares,
              );
            }
            else{
              return Center(
                child: CircularProgressIndicator()
              );
            }
          },
        ),
      ],
      ),
    );
  }

  Widget _swiperTarjetas() {   

    return FutureBuilder(
      future: movieProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        
        if(snapshot.data != null){
          return CardSwiper(
            data: snapshot.data
          );
        }
        else{
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            ),
          );
        }
        

      },
    );
  }
}