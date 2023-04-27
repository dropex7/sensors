import 'package:sensors_vkr/models/map_send_data.dart';

class MapRepo {
  Future<bool> sendData({required MapSendDataModel model}) async {
    //TODO add backend
    print("SENDING DATA TO BACKEND $model");
    return true;
  }
}
