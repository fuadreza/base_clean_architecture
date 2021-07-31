import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class MovieGenre extends Equatable {
  final int id;
  final String name;

  MovieGenre({
    @required this.id,
    @required this.name
  });

  @override
  List<Object> get props => [id, name];
}