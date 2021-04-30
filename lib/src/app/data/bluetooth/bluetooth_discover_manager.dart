import 'package:flutter_blue/flutter_blue.dart';

class BluetoothDiscoverManager {
  Stream<BluetoothState> get state => FlutterBlue.instance.state;
  Stream<List<ScanResult>> get scanResults => FlutterBlue.instance.scanResults.asBroadcastStream();

  Future<dynamic> startScan({required Duration timeout, ScanMode scanMode = ScanMode.lowLatency}) {
    return FlutterBlue.instance.startScan(timeout: timeout, scanMode: scanMode);
  }

  Future<dynamic> stopScan() async {
    FlutterBlue.instance.stopScan();
  }

  Future<List<BluetoothDevice>> devices(Duration timeout) async {
    List<BluetoothDevice> devices = [];

    await FlutterBlue
        .instance
        .scan(timeout: timeout)
        .listen((event) => devices.add(event.device))
        .asFuture();
    
    return devices;
  }
}
