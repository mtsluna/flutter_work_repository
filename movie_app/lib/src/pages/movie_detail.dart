import 'package:flutter/material.dart';
import 'package:movie_app/src/models/actor_model.dart';
import 'package:movie_app/src/models/movie_model.dart';
import 'package:movie_app/src/providers/movie_provider.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppbar(movie),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 10.0,
                ),
                _posterTitle(context, movie),
                _descripcion(movie),
                _cast(movie.id)
              ]
            ),
          )
        ],
      )
    );

  }

  Widget _crearAppbar(Movie movie){
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigo,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          movie.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0
          ),                  
        ),
        background: FadeInImage(
          image: NetworkImage(movie.getBackdrop()),
          placeholder: AssetImage('assets/no-image-2.jpg'),
          fit: BoxFit.cover,
        )
      ),
    );
  }

  Widget _posterTitle(BuildContext ct, Movie movie){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(            
            tag: movie.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(movie.getPosterImg()),
                height: 150.0,            
              ),
            ),
          ),
          SizedBox(width: 20.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title,
                  style: Theme.of(ct).textTheme.title,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  movie.originalTitle,
                  style: Theme.of(ct).textTheme.subhead,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_border),
                    Text(
                      movie.voteAverage.toString(),
                      style: Theme.of(ct).textTheme.subhead
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _descripcion(Movie movie) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _cast(int id) {
    final mProvider = new MovieProvider();    

    return FutureBuilder(
      future: mProvider.getActors(id.toString()),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        
        if(snapshot.hasData){
          return _createActors(snapshot.data);
        }
        else{
          return Center(child: CircularProgressIndicator());
        }

      },
    );

  }

  Widget _createActors(List<Actor> actors) {

    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.3,
          initialPage: 1
        ),
        itemCount: actors.length,
        itemBuilder: (ct, int i){
          return _actorCard(actors[i]);
        },
      ),
    );

  }

  Widget _actorCard(Actor actor){
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image: NetworkImage(actor.getImage()),
              placeholder: AssetImage("assets/no-image.jpg"),            
              height: 150.0,
              fit: BoxFit.cover
            ),
          ),
          Text(
            actor.name,
            overflow: TextOverflow.ellipsis,
            )
        ],
      ),
    );
  }


}