import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_device_manager.dart';
import 'package:ims/src/app/data/bluetooth/controllers/robot_controller.dart';
import 'package:ims/src/app/data/bluetooth/interactors/robot_interactor.dart';
import 'package:stacked/stacked.dart';
import 'package:synchronized/synchronized.dart';

class RemoteViewModel extends BaseViewModel {
  int _acceleration = 0;
  int _degree = 0;
  int _threshold = 10;

  bool autoDriving = true;

  final _deviceManager = GetIt.I<BluetoothDeviceManager<RobotInteractor, RobotController>>();

  int _startTime = DateTime.now().millisecondsSinceEpoch;
  var _lock = new Lock();
  double currentAcceleration = 0;

  late StreamSubscription<int> collisionSubscription;

  Future<void> initialize() async {
    await _deviceManager.controller?.startCollision();
    collisionSubscription = _deviceManager.controller!.collisionResults().listen((event) {
      print(event);
    });
  }

  @override
  Future<void> dispose() async {
    await collisionSubscription.cancel();
    await _deviceManager.controller?.stopCollision();
    super.dispose();
  }

  Future<void> onDirectionChanged(double degree, double distance) async {
    int elapsedTime = DateTime.now().millisecondsSinceEpoch - _startTime;
    currentAcceleration = distance;

    if (elapsedTime < 100 && distance != 0) return;

    print("thres: " + degree.toString());
    print("thres: " + laterally(degree).toString());

    await _lock.synchronized(() async {
      double longitude = longitudinally(degree);
      double lateral = laterally(degree);
      int acceleration = (currentAcceleration * 100.0).toInt() * longitude.toInt(); //* longitude;
      int steering = (lateral * 100.0).toInt();
      //print("Degree: " + degree.toString());

      if (acceleration > _acceleration + _threshold || acceleration < _acceleration - _threshold || acceleration == 0) {
        _startTime = DateTime.now().millisecondsSinceEpoch;
        print("old acceleration: " + _acceleration.toString());
        print("acceleration: " + acceleration.toString());
        print("thres: " + (_acceleration - _threshold).toString());
        print("thresv: " + (_threshold).toString());
        _acceleration = acceleration;
        await _deviceManager.controller?.setAcceleration(acceleration);
        await _deviceManager.controller?.setSteering(steering);
      }
    });
  }

  double longitudinally(double degree) {
    if (degree > 270 || degree < 90) return 1.0;
    if (degree < 270 || degree > 90) return -1.0;
    return 0.0;
  }

  double laterally(double degree) {
    if (degree > 0 && degree < 90) {
      return (degree / 90);
    }

    if (degree > 90 && degree < 180) {
      return ((90 - (degree - 90)) / 90);
    }

    if (degree > 180 && degree < 270) {
      return -((degree - 180) / 90);
    }

    if (degree > 270 && degree < 360) {
      return -((270 - (degree - 90)) / 90);
    }

    return 0;
  }
}
