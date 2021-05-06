import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_blue/gen/flutterblue.pbjson.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_interactor.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_controller.dart';

class BluetoothDeviceManager<Interactor extends BluetoothInteractor, Controller extends BluetoothController> {
  BluetoothDevice? _device;
  Interactor? _interactor;
  Controller? _controller;

  BluetoothDevice? get device => _device;
  Interactor? get interactor => _interactor;
  Controller? get controller => _controller;
  
  /// Find a specific [BluetoothService] by [uuid] among a list of [services].
  /// Throw a [TimeoutException]
  Future<void> connect(BluetoothDevice device, {Duration timeout = const Duration(seconds: 10)}) async {
    // Pull request fix: https://github.com/pauldemarco/flutter_blue/pull/362
    await device.connect().timeout(timeout, onTimeout: () => { throw TimeoutException("Timeout on device connect.")});

    final services = await device.discoverServices();
    _device = device;
    _interactor = BluetoothInteractor.createInstance<Interactor>(services)!;
    _controller = BluetoothController.createInstance<Controller, Interactor>(_interactor!)!;
  }

  Future<void> disconnect() async {
    await _device?.disconnect();
    _device = null; 
    _interactor = null;
    _controller = null;
  }
}
