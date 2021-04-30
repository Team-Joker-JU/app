import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_device_manager.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_discover_manager.dart';
import 'package:ims/src/app/data/bluetooth/containers/robot-container.dart';
import 'package:ims/src/app/views/bluetooth/bluetooth_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton(BluetoothDiscoverManager());
  GetIt.I.registerSingleton(BluetoothDeviceManager<RobotContainer>());
  runApp(GetMaterialApp(home: BluetoothView()));
}
