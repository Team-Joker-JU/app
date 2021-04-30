import 'package:get_it/get_it.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_device_manager.dart';
import 'package:ims/src/app/data/bluetooth/containers/robot-container.dart';
import 'package:stacked/stacked.dart';

class HandshakeViewModel extends BaseViewModel {
  BluetoothDeviceManager _deviceManager =
      GetIt.instance<BluetoothDeviceManager<RobotContainer>>();

  void initialize() {}
}
