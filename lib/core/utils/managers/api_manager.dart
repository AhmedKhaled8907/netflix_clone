class ApiManager {
  static const baseUrl = 'https://api.tvmaze.com';

  static const homePath = '/search/shows?q=all';

  static String searchMoviesBaseUrl(String query) =>
      "$baseUrl/search/shows?q=$query";

  static String getMoviesBaseUrl = "$baseUrl/$homePath";
}
