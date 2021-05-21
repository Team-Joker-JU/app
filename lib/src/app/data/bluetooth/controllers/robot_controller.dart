import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_controller.dart';
import 'package:ims/src/app/data/bluetooth/interactors/robot_interactor.dart';
import 'package:ims/src/util/ble_characteristics.dart';

class RobotController extends BluetoothController {
  RobotInteractor _interactor;

  StreamSubscription<List<int>>? _collisionSubscription;
  late StreamController<int> _collisionController = StreamController<int>();

  RobotController(this._interactor) : super(_interactor) {}

  Future<void> setAcceleration(int acceleration) {
    return this._interactor.write(Guid(ROBOT_ACCELERATION_UUID), [acceleration]);
  }

  Future<void> setSteering(int steering) {
    return this._interactor.write(Guid(ROBOT_STEERING_UUID), [steering]);
  }

  Future<bool> startCollision() async {
    return this._interactor.setNotifyValue(Guid(ROBOT_COLLISION_UUID), true);
  }

  Future<bool> stopCollision() async {
    _collisionSubscription?.cancel();
    return this._interactor.setNotifyValue(Guid(ROBOT_COLLISION_UUID), false);
  }

  Stream<int> collisionResults() {
    _collisionSubscription = this._interactor.value(Guid(ROBOT_COLLISION_UUID)).listen((event) {
      if (event.isNotEmpty) _collisionController.add(event.first);
    });

    return _collisionController.stream.asBroadcastStream();
  }
}
