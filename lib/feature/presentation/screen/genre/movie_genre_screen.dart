
import 'package:base_clean_architecture/feature/presentation/bloc/bloc.dart';
import 'package:base_clean_architecture/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieGenreScreen extends StatelessWidget {
  const MovieGenreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => gi<MovieGenreCubit>(),
          child: Container(
            child: BlocConsumer<MovieGenreCubit, MovieState>(
              listener: (context, state) {
                if (state is Error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is Init) {
                  context.read<MovieGenreCubit>().getMovieGenres();
                  return Center(
                    child: Text('Loading Genre'),
                  );
                } else if (state is Loading) {
                  return Center(
                    child: Text('Loading'),
                  );
                } else if (state is Loaded) {
                  return Center(
                    child: Text('Data: ${state.data}'),
                  );
                } else {
                  return Center(
                    child: Text('Loading'),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}