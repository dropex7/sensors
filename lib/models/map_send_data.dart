import 'package:sensors_vkr/models/map_position.dart';

class MapSendDataModel {
  final MapPosition position;
  final SensorsDataModel sensorsData;

  MapSendDataModel({
    required this.position,
    required this.sensorsData,
  });

  @override
  String toString() {
    return 'MapSendDataModel(position: $position, sensorsData: $sensorsData)';
  }
}

class SensorsDataModel {
  final double magnetometer;
  final double barometer;

  SensorsDataModel({
    required this.magnetometer,
    required this.barometer,
  });

  @override
  String toString() {
    return 'SensorsDataModel(magnetometer: $magnetometer, barometer: $barometer)';
  }
}
