import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_controller.dart';
import 'package:ims/src/app/data/bluetooth/interactors/uart_interactor.dart';
import 'package:ims/src/util/ble_characteristics.dart';

import '../../../../util/ble_characteristics.dart';

class UARTController extends BluetoothController {
  UARTInteractor _interactor;

  UARTController(this._interactor) : super(_interactor) {}

  Future<bool> test() async {
    await this._interactor.write(Guid(UART_RX_UUID), [0x00]);
    return true;
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
