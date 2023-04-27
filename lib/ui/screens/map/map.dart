import 'package:flutter/material.dart';
import 'package:sensors_vkr/config/brand_images.dart';
import 'package:sensors_vkr/ui/screens/map/components/map_configuration/map_configuration.dart';
import 'package:sensors_vkr/ui/screens/map/components/map_view.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool isConfiguring = false;

  @override
  Widget build(BuildContext context) {
    const imagePath = BrandImages.testPlan;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isConfiguring = !isConfiguring;
              });
            },
            icon: Icon(isConfiguring ? Icons.map : Icons.edit),
          )
        ],
      ),
      body: isConfiguring
          ? const MapConfiguration(imagePath: imagePath)
          : const MapView(imagePath: imagePath),
    );
  }
}
