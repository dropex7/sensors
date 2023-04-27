import 'package:flutter/material.dart';
import 'package:sensors_vkr/models/map_position.dart';
import 'package:sensors_vkr/ui/screens/map/components/position_pin.dart';

class MapImage extends StatelessWidget {
  final String imagePath;
  final Function(MapPosition)? onClick;
  final MapPosition? pinPosition;

  const MapImage({
    required this.imagePath,
    this.onClick,
    this.pinPosition,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      maxScale: 30,
      child: Center(
        child: GestureDetector(
          onTapUp: onClick == null
              ? null
              : (details) {
                  onClick?.call(MapPosition(
                    x: details.localPosition.dx,
                    y: details.localPosition.dy,
                  ));
                },
          child: Stack(
            children: [
              Image.asset(imagePath),
              if (pinPosition != null)
                Positioned(
                  left: pinPosition!.x - 12,
                  top: pinPosition!.y - 12,
                  child: const PositionPin(size: 24),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
