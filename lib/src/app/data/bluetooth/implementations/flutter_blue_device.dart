import 'package:flutter_blue/flutter_blue.dart' as Plugin;
import 'package:ims/src/app/data/bluetooth/bluetooth_device.dart';

class _FlutterBlueTarget {
  final Plugin.BluetoothDevice device;
  final Plugin.BluetoothService service;
  final Plugin.BluetoothCharacteristic characteristic;
  const _FlutterBlueTarget(this.device, this.service, this.characteristic);
}

class FlutterBlueDevice implements BluetoothDevice {
  Plugin.FlutterBlue _instance = Plugin.FlutterBlue.instance;
  _FlutterBlueTarget _target;

  FlutterBlueDevice(this._target);

  @override
  String get id => _target.device.id.id;

  @override
  String get name => _target.device.name;

  @override
  Future<bool> connect() async {
    await _target.device.connect();
    return (await _instance.connectedDevices).contains(_target.device);
  }

  @override
  Future<bool> disconnect() async {
    await _target.device.disconnect();
    return !(await _instance.connectedDevices).contains(_target.device);
  }

  @override
  Stream<List<int>> receive() {
    return _target.characteristic.value;
  }

  @override
  Future<void> send(List<int> data) {
    return _target.characteristic.write(data);
  }
}
