import 'package:base_clean_architecture/feature/presentation/screen/discovery/movie_discovery_screen.dart';
import 'package:base_clean_architecture/feature/presentation/screen/genre/movie_genre_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const String MovieGenreScreenRoute = '/';
const String MovieDiscoveryScreenRoute = 'discovery';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MovieGenreScreenRoute:
      return MaterialPageRoute(builder: (context) => MovieGenreScreen());
    case MovieDiscoveryScreenRoute:
      final args = settings.arguments as MovieDiscoveryScreenArgs;
      return MaterialPageRoute(builder: (context) => MovieDiscoveryScreen(arguments: args));
    default:
      return MaterialPageRoute(builder: (context) => MovieGenreScreen());
  }
}

void goToScreen(BuildContext context, String route, {dynamic arguments}){
  if(arguments != null){
    Navigator.pushNamed(context, route, arguments: arguments);
  }else {
    Navigator.pushNamed(context, route);
  }
}