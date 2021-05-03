import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_controller.dart';
import 'package:ims/src/app/data/bluetooth/interactors/robot_interactor.dart';
import 'package:ims/src/util/ble_characteristics.dart';

class RobotController extends BluetoothController {
  RobotInteractor _interactor;

  RobotController(this._interactor) : super(_interactor) {}

  Future<bool> handshake({Duration timeout = const Duration(seconds: 5)}) async {
    await this._interactor.setNotifyValue(Guid(ROBOT_HANDSHAKE_UUID), true);
    await this._interactor.write(Guid(ROBOT_HANDSHAKE_UUID), [0]);

    bool handshaked = false;

    try {
      var subscription;
          subscription = this
              ._interactor
              .value(Guid(ROBOT_HANDSHAKE_UUID))
              .timeout(timeout)
              .listen((event) {
            handshaked = event as bool;
            if (handshaked) subscription.cancel();
          });
    } on TimeoutException catch (_) {

    } finally {

    }

    await this._interactor.setNotifyValue(Guid(ROBOT_HANDSHAKE_UUID), false);
    return handshaked;
  }
/*
  Future<Int8> getAcceleration() async {
    return this._container.characteristicsByUUID[ROBOT_ACCELERATION_UUID]?.read() as Int8;
  }

  Future<void> setAcceleration(Uint8 acceleration) async {
    return this
        ._container
        .characteristicsByUUID[ROBOT_ACCELERATION_UUID]
        ?.write([acceleration as int]);*
  }*/
}
