import 'package:flutter_blue/flutter_blue.dart';

class GATTResolver {
  /// Find a specific [BluetoothService] by [uuid] among a list of [services].
  static BluetoothService? findService(List<BluetoothService> services, String uuid) {
    for (var s in services) if (s.uuid == Guid(uuid)) return s;
  }

  /// Find a specific [BluetoothCharacteristic] by [uuid] in a [service].
  static BluetoothCharacteristic? findCharacteristic(BluetoothService service, String uuid) {
    for (var c in service.characteristics) if (c.uuid == Guid(uuid)) return c;
  }
}
