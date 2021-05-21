import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';

import '../data/bluetooth/bluetooth_device_manager.dart';
import '../data/bluetooth/controllers/robot_controller.dart';
import '../data/bluetooth/interactors/robot_interactor.dart';
import '../views/bluetooth/bluetooth_view.dart';

class DashboardViewModel extends BaseViewModel {
  final _deviceManager = GetIt.I<BluetoothDeviceManager<RobotInteractor, RobotController>>();

  String get deviceName => _deviceManager.device!.name;
  String get deviceAddress => _deviceManager.device!.id.id;

  Future<void> disconnect() async {
    await _deviceManager.disconnect();

    Get.offAll(BluetoothView());
  }
}
