import 'dart:typed_data';

abstract class BluetoothDevice {
  final String name;
  final String id;

  BluetoothDevice(this.name, this.id);

  Future<bool> connect();
  Future<bool> disconnect();
  Stream<List<int>> receive();
  Future<void> send(List<int> data);
}
