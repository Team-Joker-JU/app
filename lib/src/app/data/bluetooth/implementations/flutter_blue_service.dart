import 'package:flutter_blue/flutter_blue.dart' as Plugin;
import 'package:ims/src/app/data/bluetooth/bluetooth_device.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_service.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_state.dart';

class FlutterBlueService implements BluetoothService {
  Plugin.FlutterBlue _instance = Plugin.FlutterBlue.instance;

  @override
  Future<bool> get isAvailable => _instance.isAvailable;

  @override
  Future<bool> get isEnabled => _instance.isOn;

  @override
  Stream<BluetoothState> onStateChanged() async* {
    await for (Plugin.BluetoothState state in _instance.state) {
      switch (state) {
        case Plugin.BluetoothState.on:
          yield BluetoothState.CONNECTED;
          break;
        case Plugin.BluetoothState.off:
          yield BluetoothState.DISCONNECTED;
          break;
        case Plugin.BluetoothState.turningOn:
          yield BluetoothState.TURNING_ON;
          break;
        case Plugin.BluetoothState.turningOff:
          yield BluetoothState.TURNING_OFF;
          break;
        case Plugin.BluetoothState.unknown:
          yield BluetoothState.UNKNOWN;
          break;
        case Plugin.BluetoothState.unavailable:
          yield BluetoothState.UNAVAILABLE;
          break;
        case Plugin.BluetoothState.unauthorized:
          yield BluetoothState.UNAUTHORIZED;
          break;
      }
    }
  }

  @override
  Future<bool> requestEnable() {
    // TODO: implement requestEnable
    throw UnimplementedError();
  }

  @override
  Future<List<BluetoothDevice>> scan(Duration duration) async {
    List<BluetoothDevice> devices = [];

    _instance.scan(timeout: duration).listen((result) {
      //devices.add(FlutterBlueDevice())
    });

    return devices;
  }
}
