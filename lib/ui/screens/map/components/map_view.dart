import 'package:flutter/material.dart';
import 'package:sensors_vkr/ui/screens/map/components/map_image.dart';

class MapView extends StatelessWidget {
  final String imagePath;

  const MapView({required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MapImage(
      onClick: null,
      imagePath: imagePath,
    );
  }
}
