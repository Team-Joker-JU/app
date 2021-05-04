import 'dart:async';
import 'dart:developer';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_device_manager.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_discover_manager.dart';
import 'package:ims/src/app/data/bluetooth/controllers/robot_controller.dart';
import 'package:ims/src/app/data/bluetooth/interactors/robot_interactor.dart';
import 'package:ims/src/app/views/handshake/handshake_view.dart';
import 'package:stacked/stacked.dart';

import '../data/bluetooth/bluetooth_device_manager.dart';

class BluetoothViewModel extends BaseViewModel {
  final _discoveryManager = GetIt.I<BluetoothDiscoverManager>();
  final _deviceManager = GetIt.I<BluetoothDeviceManager<RobotInteractor, RobotController>>();

  final _refreshTimeout = Duration(seconds: 10);

  Stream<List<ScanResult>> get scanResults => _discoveryManager.scanResults;

  bool _isEnabled = false;
  bool get isEnabled => _isEnabled;

  bool _isRefreshing = false;
  bool get isRefreshing => _isRefreshing;

  BluetoothDevice? _selectedDevice;
  BluetoothDevice? get selectedDevice => _selectedDevice;

  Future<void> initialize() {
    return refresh();
  }

  Future<void> connect(BluetoothDevice device) async {
    _selectedDevice = device;
    notifyListeners();

    try {
      await _deviceManager.connect(device);
      await Get.to(HandshakeView());
      await disconnect();
    } on TimeoutException catch (e) {
      await disconnect();
      log(e.message!);
    }
  }

  Future<void> disconnect() async {
    await _deviceManager.disconnect();
    _selectedDevice = null;
    notifyListeners();
  }

  Future<void> refresh() async {
    await _discoveryManager.stopScan();

    _isRefreshing = true;
    notifyListeners();

    await _discoveryManager.startScan(timeout: _refreshTimeout);
    _isRefreshing = false;
    notifyListeners();
  }
}
