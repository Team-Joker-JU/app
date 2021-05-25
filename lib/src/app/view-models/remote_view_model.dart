import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_device_manager.dart';
import 'package:ims/src/app/data/bluetooth/controllers/robot_controller.dart';
import 'package:ims/src/app/data/bluetooth/interactors/robot_interactor.dart';
import 'package:stacked/stacked.dart';
import 'package:synchronized/synchronized.dart';

class RemoteViewModel extends BaseViewModel {
  int _acceleration = 0;
  int _steering = 0;
  int _threshold = 10;

  bool autoDriving = true;

  final _deviceManager = GetIt.I<BluetoothDeviceManager<RobotInteractor, RobotController>>();

  int _startTime = DateTime.now().millisecondsSinceEpoch;

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

  Future<void> toggleAutomode() async {
    await _deviceManager.controller!.setAutomode();
  }

  var _lock = new Lock();
  
  Future<void> onDirectionChanged(double degree, double distance) async {
    int elapsedTime = DateTime.now().millisecondsSinceEpoch - _startTime;
    currentAcceleration = distance;

    if (elapsedTime < 100 && distance != 0) return;

    await _lock.synchronized(() async {
      double longitude = longitudinally(degree);
      double lateral = laterally(degree);
      int acceleration = (currentAcceleration * 100.0).toInt() * longitude.toInt(); //* longitude;
      int steering = (lateral * 100.0).toInt();


      if (acceleration > _acceleration + _threshold || 
          acceleration < _acceleration - _threshold || 
          steering > _steering + _threshold || 
          steering < _steering - _threshold || 
          acceleration == 0) {
        _startTime = DateTime.now().millisecondsSinceEpoch;
        _acceleration = acceleration;
        _steering = steering;
        await _deviceManager.controller?.setAcceleration(acceleration);
        await _deviceManager.controller?.setSteering(steering);
        print("Acceleration" + acceleration.toString());
        print("Steering" + steering.toString());
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
