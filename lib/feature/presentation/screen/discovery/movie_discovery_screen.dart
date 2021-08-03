import 'package:base_clean_architecture/core/extension/widget_extension.dart';
import 'package:base_clean_architecture/feature/presentation/bloc/bloc.dart';
import 'package:base_clean_architecture/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: BlocProvider(
          create: (_) => di<MovieDiscoveryCubit>(),
          child: BlocConsumer<MovieDiscoveryCubit, MovieState>(
            listener: (_, state) {
              if (state is Error) {
                context.showSnackBar(state.message);
              }
            },
            builder: (context, state) {
              if (state is Init) {
                context.read<MovieDiscoveryCubit>().getMoviesDiscoveryByGenre(arguments.genreId.toString());
                return Center(
                  child: Text('Loading Movies'),
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
    );
  }
}
