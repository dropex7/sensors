import 'package:equatable/equatable.dart';
import 'package:sensors_vkr/models/map_position.dart';

abstract class MapConfigState extends Equatable {}

class MapConfigPosNotSelectedState extends MapConfigState {
  @override
  List<Object?> get props => [];
}

class MapConfigPosSelectedState extends MapConfigState {
  final MapPosition position;

  MapConfigPosSelectedState({
    required this.position,
  });

  @override
  List<Object?> get props => [position];
}
