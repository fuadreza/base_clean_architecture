import 'package:base_clean_architecture/feature/presentation/screen/genre/movie_genre_screen.dart';
import 'package:flutter/material.dart';
import 'package:base_clean_architecture/injection/injection.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieGenreScreen(),
    );
  }
}
