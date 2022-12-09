class FilmieModel {
  final String Title, Poster, Year, Plot, Star;

  FilmieModel({
    required this.Title,
    required this.Poster,
    required this.Year,
    required this.Plot,
    required this.Star,
  });

  factory FilmieModel.fromJSON(Map parsedJson) {
    return FilmieModel(
        Title: parsedJson['Title'],
        Poster: parsedJson['Poster'],
        Year: parsedJson['Year'],
        Plot: parsedJson['Plot'],
        Star: parsedJson['Star']);
  }
}
