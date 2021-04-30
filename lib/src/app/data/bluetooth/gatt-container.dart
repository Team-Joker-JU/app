import 'package:flutter_blue/flutter_blue.dart';
import 'package:ims/src/app/data/bluetooth/containers/robot-container.dart';

abstract class GATTContainer {
  Map<String, BluetoothService> get servicesByUUID;
  Map<String, BluetoothCharacteristic> get characteristicsByUUID;
  Map<String, BluetoothDescriptor> get descriptorsByUUID;

  GATTContainer(List<BluetoothService> services);

  static GATTContainer? createInstance(Type type, List<BluetoothService> services) {
    switch (type) {
      case RobotContainer:
        return RobotContainer(services);
    }
  }
}
