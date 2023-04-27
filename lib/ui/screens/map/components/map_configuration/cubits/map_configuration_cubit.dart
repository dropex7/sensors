import 'dart:async';

import 'package:flutter_barometer/flutter_barometer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:sensors_vkr/api/map.dart';
import 'package:sensors_vkr/models/map_position.dart';
import 'package:sensors_vkr/models/map_send_data.dart';
import 'package:sensors_vkr/ui/screens/map/components/map_configuration/cubits/map_configuration_state.dart';

class MapConfigurationCubit extends Cubit<MapConfigState> {
  final MapRepo repo;
  double? _magnetometer;
  double? _barometer;

  StreamSubscription? _magnetometerSubscription;
  StreamSubscription? _barometerSubscription;

  MapConfigurationCubit({
    required this.repo,
  }) : super(MapConfigPosNotSelectedState()) {
    _magnetometerSubscription = magnetometerEvents.listen(
      (MagnetometerEvent event) {
        _magnetometer = event.x + event.y + event.z;
      },
    );

    _barometerSubscription =
        flutterBarometerEvents.listen((FlutterBarometerEvent event) {
      _barometer = event.pressure;
    });
  }

  void setPosition({required MapPosition pinPosition}) {
    emit(MapConfigPosSelectedState(position: pinPosition));
  }

  void sendData() {
    final cState = state;
    if (cState is! MapConfigPosSelectedState) {
      return;
    }

    if (_magnetometer == null) {
      Get.snackbar("Ошибка", "Датчик магнитометра не подключен");
      return;
    }

    if (_barometer == null) {
      Get.snackbar("Ошибка", "Датчик барометра не подключен");
      return;
    }

    repo.sendData(
      model: MapSendDataModel(
        position: cState.position,
        sensorsData: SensorsDataModel(
          magnetometer: _magnetometer!,
          barometer: _barometer!,
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _magnetometerSubscription?.cancel();
    _barometerSubscription?.cancel();
    return super.close();
  }
}
