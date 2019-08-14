import 'package:flutter/material.dart';
import 'package:movie_app/src/models/movie_model.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Movie> movies;
  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3
  );
  final Function siguientePagina;
  

  MovieHorizontal({ @required this.movies, @required this.siguientePagina});


  @override
  Widget build(BuildContext context) {
    
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener((){
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
        siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height*0.3,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        //children: _cards(context),
        itemCount: movies.length,
        itemBuilder: (context, int i){
          return _card(context, movies[i]);
        },
      ),
    );
  }

  Widget _card(BuildContext ct, Movie movie){

    movie.uniqueId = '${movie.id}-horizontal';

    final peliculaTarjeta = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          Hero(
            tag: movie.uniqueId,
            child: ClipRRect(              
              borderRadius: BorderRadius.circular(15.0),              
              child: FadeInImage(                                
                image: NetworkImage(movie.getPosterImg()),
                placeholder: AssetImage('assets/no-image.jpg'),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            ),
          ),
          SizedBox(height: 5.0,),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(ct).textTheme.caption,              
          ),            
        ],
      ),
    );

    return GestureDetector(
      child: peliculaTarjeta,
      onTap: (){
        Navigator.pushNamed(ct,
          'detalle',
          arguments: movie
        );
      },
    );

  }

  List<Widget> _cards(BuildContext ct){
    return movies.map((movie){
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(              
              borderRadius: BorderRadius.circular(15.0),              
              child: FadeInImage(                                
                image: NetworkImage(movie.getPosterImg()),
                placeholder: AssetImage('assets/no-image.jpg'),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            ),
            SizedBox(height: 5.0,),
            Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(ct).textTheme.caption,              
            ),            
          ],
        ),
      );
    }).toList();
  }

}