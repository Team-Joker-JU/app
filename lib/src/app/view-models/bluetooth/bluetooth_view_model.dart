import 'dart:developer';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:stacked/stacked.dart';

class BluetoothViewModel extends BaseViewModel {
  FlutterBlue _bluetooth = FlutterBlue.instance;
  List<BluetoothDevice> _devices = [];
  bool _isRefreshing = false;

  bool get isRefreshing => _isRefreshing;
  List<BluetoothDevice> get devices => _devices;

  set isRefreshing(bool value) {
    _isRefreshing = value;
    notifyListeners();
  }

  Future<void> initialize() async {
    bool refreshed = await this.refresh();
  }

  Future<bool> connect(int index) async {
    var device = this._devices[index];
    await device.connect();
    return ((await this._bluetooth.connectedDevices).contains(device));
  }

  Future<bool> refresh() async {
    this.isRefreshing = true;
    this._devices.clear();

    bool available = await this._bluetooth.isAvailable;
    bool enabled = await this._bluetooth.isOn;

    if (available && !enabled) {}

    log(enabled.toString());
    if (enabled) {
      await this
          ._bluetooth
          .scan(timeout: Duration(seconds: 5))
          .listen((event) => _devices.add(event.device))
          .asFuture();
    }
    log("message");
    this.isRefreshing = false;
    return available && enabled;
  }
}
