import 'package:flutter_blue/flutter_blue.dart';
import 'package:ims/src/app/data/bluetooth/gatt-container.dart';
import 'package:ims/src/app/data/bluetooth/gatt_resolver.dart';
import 'package:ims/src/util/gatt_services.dart' as GATTServices;
import 'package:ims/src/util/gatt_characteristics.dart' as GATTCharacteristics;

class RobotContainer extends GATTContainer {
  Map<String, BluetoothService> _servicesByUUID = Map();
  Map<String, BluetoothCharacteristic> _characteristicsByUUID = Map();
  Map<String, BluetoothDescriptor> _descriptorsByUUID = Map();

  RobotContainer(List<BluetoothService> services) : super(services) {
    var robotService = GATTResolver.findService(services, GATTServices.ROBOT_UUID)!;
    var robotHandshake = GATTResolver.findCharacteristic(robotService, GATTCharacteristics.ROBOT_HANDSHAKE_UUID)!;
    var robotAcceleration = GATTResolver.findCharacteristic(robotService, GATTCharacteristics.ROBOT_ACCELERATION_UUID)!;

    this._servicesByUUID[GATTServices.ROBOT_UUID] = robotService;

    this._characteristicsByUUID.addEntries([
      MapEntry(GATTCharacteristics.ROBOT_HANDSHAKE_UUID, robotHandshake),
      MapEntry(GATTCharacteristics.ROBOT_ACCELERATION_UUID, robotAcceleration),
    ]);
  }

  @override
  Map<String, BluetoothService> get servicesByUUID => this._servicesByUUID;

  @override
  Map<String, BluetoothCharacteristic> get characteristicsByUUID => this._characteristicsByUUID;

  @override
  Map<String, BluetoothDescriptor> get descriptorsByUUID => this._descriptorsByUUID;
}
