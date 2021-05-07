import 'package:stacked/stacked.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart';

class ControllerViewModel extends BaseViewModel {
  void setAcceleration(degree) {
    int acceleration = cos(radians(degree)).round();
    print("Y: " + acceleration.toString());
  }

  void setSteering(degree) {
    int steering = sin(radians(degree)).round();
    print("X: " + steering.toString());
  }
}
