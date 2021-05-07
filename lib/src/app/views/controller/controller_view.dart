import 'package:control_pad/control_pad.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ims/src/app/view-models/controller_view_model.dart';
import 'package:stacked/stacked.dart';

class ControllerView extends ViewModelBuilderWidget<ControllerViewModel> {
  @override
  bool get reactive => true;

  @override
  bool get createNewModelOnInsert => true;

  @override
  bool get disposeViewModel => true;

  @override
  void onViewModelReady(ControllerViewModel viewModel) async {}

  @override
  ControllerViewModel viewModelBuilder(BuildContext context) {
    return ControllerViewModel();
  }

  @override
  Widget builder(
      BuildContext context, ControllerViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Controller View"),
      ),
      body: Container(
        child: JoystickView(
          onDirectionChanged: (degree, distance) {
            viewModel.setSteering(degree);
            viewModel.setAcceleration(degree);
          },
        ),
      ),
    );
  }
}
