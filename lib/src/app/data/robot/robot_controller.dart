import 'package:get_it/get_it.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_device_manager.dart';
import 'package:ims/src/app/data/bluetooth/containers/robot-container.dart';
import 'package:ims/src/app/data/bluetooth/gatt-container.dart';
import 'package:ims/src/util/gatt_characteristics.dart';

class RobotController {
  RobotContainer _container;

  RobotController(this._container) {}

  Future<void> handshake({Duration timeout = const Duration(seconds: 5)}) async {
    //await this._container.characteristicsByUUID[ROBOT_HANDSHAKE_UUID]!.setNotifyValue(true);
    if (this._container.characteristicsByUUID[ROBOT_HANDSHAKE_UUID] != null) print("NULL");
    await this._container.characteristicsByUUID[ROBOT_HANDSHAKE_UUID]!.write([0x00]);

    List<int> result = await this._container.characteristicsByUUID[ROBOT_HANDSHAKE_UUID]!.read();
    print(result.length);
    result.forEach((element) {
      print(element);
      print("hej");
    });
    /*this._container.characteristicsByUUID[ROBOT_HANDSHAKE_UUID]!.value.listen((event) {
      print("hej");
      print(event);
    });*/
  }
}
