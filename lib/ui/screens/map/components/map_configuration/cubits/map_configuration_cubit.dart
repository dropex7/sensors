import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_vkr/api/map.dart';
import 'package:sensors_vkr/models/map_position.dart';
import 'package:sensors_vkr/models/map_send_data.dart';
import 'package:sensors_vkr/ui/screens/map/components/map_configuration/cubits/map_configuration_state.dart';

class MapConfigurationCubit extends Cubit<MapConfigState> {
  final MapRepo repo;

  MapConfigurationCubit({
    required this.repo,
  }) : super(MapConfigPosNotSelectedState());

  void setPosition({required MapPosition pinPosition}) {
    emit(MapConfigPosSelectedState(position: pinPosition));
  }

  void sendData() {
    repo.sendData(model: MapSendDataModel());
  }
}
