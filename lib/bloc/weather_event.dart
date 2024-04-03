part of 'weather_bloc.dart';

@immutable
sealed class WeatherBlocEvent {}

final class WeatherFetched extends WeatherBlocEvent {}
