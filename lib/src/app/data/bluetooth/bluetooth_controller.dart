import 'package:ims/src/app/data/bluetooth/bluetooth_interactor.dart';
import 'package:ims/src/app/data/bluetooth/controllers/robot_controller.dart';
import 'package:ims/src/app/data/bluetooth/interactors/robot_interactor.dart';

class BluetoothController<Interactor extends BluetoothInteractor> {

  BluetoothController(Interactor interactor);

  static Controller? createInstance<
    Controller extends BluetoothController, 
    Interactor extends BluetoothInteractor
  >(Interactor interactor) {
    switch (Controller) {
      case RobotController:
        return RobotController(interactor as RobotInteractor) as Controller;
    }
  }
}