import 'package:flutter_blue/flutter_blue.dart';
import 'package:ims/src/app/data/bluetooth/containers/robot-container.dart';
import 'package:ims/src/app/data/bluetooth/gatt-container.dart';
import 'package:ims/src/app/data/bluetooth/gatt_resolver.dart';
import 'package:ims/src/app/data/robot/robot_controller.dart';
import 'package:ims/src/util/gatt_characteristics.dart';
import 'package:ims/src/util/gatt_services.dart';

class BluetoothDeviceManager<T extends GATTContainer> {
  BluetoothDevice? _device;
  GATTContainer? _container;

  BluetoothDevice? get device => _device;
  GATTContainer? get container => _container;

  Future<bool> connect(BluetoothDevice device) async {
    await device.connect(timeout: Duration(seconds: 10), autoConnect: false);

    device.state.listen((event) async {
      switch (event) {
        case BluetoothDeviceState.connected:
          print("NU");
          break;

        case BluetoothDeviceState.disconnected:
          print("disconnected");
          break;
        default:
          break;
      }
    });

    bool connected = (await FlutterBlue.instance.connectedDevices).contains(device);

    if (connected) {
      this._device = device;
      this._container = GATTContainer.createInstance(T, await device.discoverServices())!;
      print(this._container?.servicesByUUID);
      print(this._container?.characteristicsByUUID);
      print(FlutterBlue.instance.connectedDevices);
      //var service = GATTResolver.findService(await device.discoverServices(), ROBOT_UUID)!;
      //await GATTResolver.findCharacteristic(service, ROBOT_ACCELERATION_UUID)!.write([0x00]);

      //await characteristic.write([0x00]);

      var controller = RobotController(_container as RobotContainer);
      await controller.handshake();
    }

    return connected;
  }

  Future<void> disconnect() async {
    await this._device?.disconnect();
    this._device = null;
    this._container = null;
  }
}
