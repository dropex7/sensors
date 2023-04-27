import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_vkr/api/map.dart';
import 'package:sensors_vkr/ui/screens/map/components/map_configuration/cubits/map_configuration_cubit.dart';
import 'package:sensors_vkr/ui/screens/map/components/map_configuration/cubits/map_configuration_state.dart';
import 'package:sensors_vkr/ui/screens/map/components/map_image.dart';

class MapConfiguration extends StatelessWidget {
  final String imagePath;

  const MapConfiguration({
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapConfigurationCubit(
        repo: MapRepo(),
      ),
      child: Builder(builder: (context) {
        final cubit = context.watch<MapConfigurationCubit>();
        final state = cubit.state;
        return Stack(
          children: [
            MapImage(
              onClick: (clickedPos) {
                cubit.setPosition(pinPosition: clickedPos);
              },
              pinPosition:
                  state is MapConfigPosSelectedState ? state.position : null,
              imagePath: imagePath,
            ),
            if (state is MapConfigPosSelectedState)
              Positioned(
                bottom: 24,
                left: 24,
                right: 24,
                child: ElevatedButton(
                  onPressed: cubit.sendData,
                  child: const Text('Отправить данные из этой точки'),
                ),
              )
          ],
        );
      }),
    );
  }
}
