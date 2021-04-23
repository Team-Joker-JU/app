import 'package:flutter/material.dart';
import 'package:ims/src/app/data/bluetooth/bluetooth_device.dart';
import 'package:ims/src/app/view-models/mower_controller/mower_controller_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:control_pad/control_pad.dart';

class MowerControllerView
    extends ViewModelBuilderWidget<MowerControllerViewModel> {
  @override
  bool get reactive => true;

  @override
  bool get createNewModelOnInsert => true;

  @override
  bool get disposeViewModel => true;

  @override
  void onViewModelReady(MowerControllerViewModel viewModel) {
    super.onViewModelReady(viewModel);
  }

  @override
  MowerControllerViewModel viewModelBuilder(BuildContext context) {
    // TODO: implement viewModelBuilder
    return MowerControllerViewModel();
  }

  @override
  Widget builder(
      BuildContext context, MowerControllerViewModel viewModel, Widget child) {
    // TODO: implement builder
    return Scaffold(
      appBar: AppBar(
        title: Text("Mower controller view"),
      ),
      body: Container(
        color: Colors.white,
        child: JoystickView(
          onDirectionChanged: (degree, distance) {
            print('Degree: $degree');
            print('Distance: $distance');
          },
        ),
      ),
    );
  }
}
