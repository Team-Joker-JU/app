//@dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:ims/src/app/data/bluetooth/controllers/robot_controller.dart';
import 'package:ims/src/app/data/bluetooth/controllers/uart_controller.dart';
import 'package:ims/src/app/data/bluetooth/interactors/robot_interactor.dart';
import 'package:ims/src/app/data/bluetooth/interactors/uart_interactor.dart';
import 'package:ims/src/app/views/nav/nav_view.dart';

import 'src/app/data/bluetooth/bluetooth_device_manager.dart';
import 'src/app/data/bluetooth/bluetooth_discover_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton(BluetoothDiscoverManager());
  GetIt.I.registerSingleton(
      BluetoothDeviceManager<RobotInteractor, RobotController>());
  GetIt.I.registerSingleton(
      BluetoothDeviceManager<UARTInteractor, UARTController>());
  runApp(GetMaterialApp(home: NavView()));
}
