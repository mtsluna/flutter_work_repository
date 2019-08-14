import 'package:flutter/material.dart';
import 'package:movie_app/src/models/movie_model.dart';
import 'package:movie_app/src/providers/movie_provider.dart';

class DataSearch extends SearchDelegate{
  
  final movieProvider = MovieProvider();

  final peliculas = [
    'Fast & Furious 1',
    'Fast & Furious 2',
    'Fast & Furious 3',
    'Fast & Furious 4',
    'Fast & Furious 5',
    'Fast & Furious 6',
    'Fast & Furious 7',
    'Fast & Furious 8',
    'Fast & Furious 9'
  ];

  final peliculasRecientes = [
    'Mision Imposible 6',
    'Mision Imposible 5',
    'Mision Imposible 4',
    'Mision Imposible 3',
    'Mision Imposible 2',
    'Mision Imposible 1',
  ];

  String seleccion = '';
  
  @override
  List<Widget> buildActions(BuildContext context) {
    //Acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow, 
        progress: transitionAnimation,       
      ),
      onPressed: (){
        close(context, null);
      },      
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    return Center(
      child: Container(
        height: 100.0,
        width:  100.0,
        color: Colors.green,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Las sugerencias que aparece cuando la persona escribe
    
    if(query.isEmpty){
      return Container();
    }

    return FutureBuilder(
      future: movieProvider.searchMovie(query),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        
        final movies = snapshot.data;

        if(snapshot.hasData){
          return ListView(
            children: movies.map((movie){

              movie.uniqueId = movie.id.toString()+'-search';

              return ListTile(
                leading: Hero(
                  tag: movie.uniqueId,
                  child: FadeInImage(
                    image: NetworkImage(
                      movie.getPosterImg(),
                    ),
                    placeholder: AssetImage('assets/no-image.jpg'),
                    width: 50.0,
                    fit: BoxFit.contain
                  ),
                ),
                title: Text(movie.title),
                subtitle: Text(movie.originalTitle),
                onTap: (){
                  close(context, null);
                  Navigator.pushNamed(
                    context, 
                    'detalle', 
                    arguments: movie
                  );
                },
              );
            }).toList()
          ); 
        }
        else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
    
  }  
}