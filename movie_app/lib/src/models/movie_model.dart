class Movies{

  List<Movie> items = new List();

  Movies();

  Movies.fromJsonList(List<dynamic> jsonList){

    if(jsonList == null){
      return;
    }
    else{
      for(var item in jsonList){
        final movie = new Movie.fromJsonMap(item);
        items.add(movie);
      }
    }

  }

}

class Movie {
  String uniqueId;
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;

  Movie({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  Movie.fromJsonMap(Map<String, dynamic> json){
    voteCount         = json['vote_count'];
    id                = json['id'];
    video             = json['video'];
    voteAverage       = json['vote_average']/1;
    title             = json['title'];
    popularity        = json['popularity']/1;
    posterPath        = json['poster_path'];
    originalLanguage  = json['original_language'];
    originalTitle     = json['original_title'];
    genreIds          = json['genre_ids'].cast<int>();
    backdropPath      = json['backdrop_path'];
    adult             = json['adult'];
    overview          = json['overview'];
    releaseDate       = json['realse_date'];
  }

  getPosterImg(){

    if(posterPath == null){
      return 'https://upload.wikimedia.org/wikipedia/commons/f/fc/No_picture_available.png';
    }
    else{
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    }

  }

  getBackdrop(){
    if(backdropPath == null){
      return 'https://secureservercdn.net/45.40.144.200/umf.013.myftpupload.com/wp-content/uploads/2019/07/noimageavailable.png';
    }
    else{
      return 'https://image.tmdb.org/t/p/w500$backdropPath';
    }
  }

}
