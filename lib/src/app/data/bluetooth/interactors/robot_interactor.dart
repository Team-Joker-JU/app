import 'package:flutter_blue/flutter_blue.dart';

import '../../../../util/ble_services.dart' as BLEServices;
import '../../../../util/ble_characteristics.dart' as BLECharacteristics;
import '../bluetooth_interactor.dart';
import '../bluetooth_resolver.dart';

class RobotInteractor extends BluetoothInteractor {
  factory RobotInteractor(List<BluetoothService> services) {
    final robotService = BluetoothResolver.findService(services, Guid(BLEServices.ROBOT_UUID))!;
    final robotHandshake = BluetoothResolver.findCharacteristic(robotService, Guid(BLECharacteristics.ROBOT_HANDSHAKE_UUID))!;
    final robotAcceleration = BluetoothResolver.findCharacteristic(robotService, Guid(BLECharacteristics.ROBOT_ACCELERATION_UUID))!;
    final robotSteering = BluetoothResolver.findCharacteristic(robotService, Guid(BLECharacteristics.ROBOT_STEERING_UUID))!;

    final servicesByUUID = Map<Guid, BluetoothService>();
    servicesByUUID[Guid(BLEServices.ROBOT_UUID)] = robotService;

    final characteristicsByUUID = Map<Guid, BluetoothCharacteristic>();
    characteristicsByUUID[Guid(BLECharacteristics.ROBOT_HANDSHAKE_UUID)] = robotHandshake;
    characteristicsByUUID[Guid(BLECharacteristics.ROBOT_ACCELERATION_UUID)] = robotAcceleration;
    characteristicsByUUID[Guid(BLECharacteristics.ROBOT_STEERING_UUID)] = robotSteering;

    return RobotInteractor._(servicesByUUID, characteristicsByUUID);
  }

  RobotInteractor._(
    Map<Guid, BluetoothService> servicesByUUID, 
    Map<Guid, BluetoothCharacteristic> characteristicsByUUID
  ) : super(servicesByUUID, characteristicsByUUID);
}
