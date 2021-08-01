import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class MovieState extends Equatable {
  @override
  List<Object> get props => [];
}

class Init extends MovieState {}

class Loading extends MovieState {}

class Loaded extends MovieState {
  final dynamic data;

  Loaded({required this.data});

  @override
  List<Object> get props => [data];
}

class Error extends MovieState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
