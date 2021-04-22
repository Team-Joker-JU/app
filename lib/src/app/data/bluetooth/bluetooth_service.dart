import 'package:ims/src/app/data/bluetooth/bluetooth_device.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_state.dart';

abstract class BluetoothService {
  Future<bool> get isAvailable;
  Future<bool> get isEnabled;

  Future<List<BluetoothDevice>> scan(Duration duration);
  Future<bool> requestEnable();
  Stream<BluetoothState> onStateChanged();
}
