import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieDiscoveryScreenArgs {
  final int genreId;
  final String genreName;

  MovieDiscoveryScreenArgs({required this.genreId, required this.genreName});
}

class MovieDiscoveryScreen extends StatelessWidget {
  final MovieDiscoveryScreenArgs arguments;

  MovieDiscoveryScreen({
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text(arguments.genreName),
          ),
        ),
      ),
    );
  }
}
