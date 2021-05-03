import 'package:flutter_blue/flutter_blue.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_interactor.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_resolver.dart';
import 'package:ims/src/util/ble_services.dart' as BLEServices;
import 'package:ims/src/util/ble_characteristics.dart' as BLECharacteristics;

class UARTInteractor extends BluetoothInteractor {

  factory UARTInteractor(List<BluetoothService> services) {
    var uartService = BluetoothResolver.findService(services, Guid(BLEServices.UART_UUID))!;
    var uartRX = BluetoothResolver.findCharacteristic(uartService, Guid(BLECharacteristics.UART_RX_UUID))!;
    var uartTX = BluetoothResolver.findCharacteristic(uartService, Guid(BLECharacteristics.UART_TX_UUID))!;

    final servicesByUUID = Map<Guid, BluetoothService>();
    servicesByUUID[Guid(BLEServices.UART_UUID)] = uartService;

    final characteristicsByUUID = Map<Guid, BluetoothCharacteristic>();
    characteristicsByUUID[Guid(BLECharacteristics.UART_RX_UUID)] = uartRX;
    characteristicsByUUID[Guid(BLECharacteristics.UART_TX_UUID)] = uartTX;

    return UARTInteractor._(servicesByUUID, characteristicsByUUID);
  }

  UARTInteractor._(
    Map<Guid, BluetoothService> servicesByUUID, 
    Map<Guid, BluetoothCharacteristic> characteristicsByUUID
  ) : super(servicesByUUID, characteristicsByUUID);
}