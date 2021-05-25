//@dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:ims/src/app/data/bluetooth/controllers/robot_controller.dart';
import 'package:ims/src/app/data/bluetooth/interactors/robot_interactor.dart';

import 'src/app/data/bluetooth/bluetooth_device_manager.dart';
import 'src/app/data/bluetooth/bluetooth_discover_manager.dart';
import 'src/app/views/bluetooth/bluetooth_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton(BluetoothDiscoverManager());
  GetIt.I.registerSingleton(BluetoothDeviceManager<RobotInteractor, RobotController>());

  runApp(GetMaterialApp(home: BluetoothView()));
}
