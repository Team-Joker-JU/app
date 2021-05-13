import 'package:get_it/get_it.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_device_manager.dart';
import 'package:ims/src/app/data/bluetooth/controllers/robot_controller.dart';
import 'package:ims/src/app/data/bluetooth/interactors/robot_interactor.dart';
import 'package:stacked/stacked.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart';

class ControllerViewModel extends BaseViewModel {
  int acceleration = 0;
  int steering = 0;
  bool autoDriving = true;

  final _deviceManager =
      GetIt.I<BluetoothDeviceManager<RobotInteractor, RobotController>>();

  void setAcceleration(distance) {
    acceleration = (distance * 100.0).round();
    _deviceManager.controller?.setAcceleration(acceleration);
  }

  void setSteering(degree) {
    print(degree);
    if (degree > 180.0) {
      steering = ((degree % 180) / 2 - 90).round();
    } else {
      steering = ((degree % 180) / 2).round();
    }
    _deviceManager.controller?.setSteering(steering);
  }

  void switchMowerMode() {}
}
