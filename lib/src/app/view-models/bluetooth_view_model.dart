import 'dart:developer';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_device_manager.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_discover_manager.dart';
import 'package:ims/src/app/data/bluetooth/containers/robot-container.dart';
import 'package:ims/src/app/views/handshake/handshake_view.dart';
import 'package:stacked/stacked.dart';

class BluetoothViewModel extends BaseViewModel {
  BluetoothDiscoverManager _discoveryManager = GetIt.instance<BluetoothDiscoverManager>();

  BluetoothDeviceManager _deviceManager = GetIt.instance<BluetoothDeviceManager<RobotContainer>>();

  Stream<List<ScanResult>> get scanResults => _discoveryManager.scanResults;

  bool _isRefreshing = false;
  bool get isRefreshing => _isRefreshing;

  set isRefreshing(bool value) {
    _isRefreshing = value;
    notifyListeners();
  }

  void initialize() {
    this.refresh();
  }

  Future<void> connect(BluetoothDevice device) async {
    this._isRefreshing = false;
    await this._discoveryManager.stopScan();

    if (await _deviceManager.connect(device)) Get.to(HandshakeView())!.whenComplete(() => _deviceManager.disconnect());
  }

  void refresh() {
    this.isRefreshing = true;
    this._discoveryManager.startScan(timeout: Duration(seconds: 10)).whenComplete(() => this.isRefreshing = false);
  }
}
