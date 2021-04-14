import 'package:flutter/material.dart';
import 'package:ims/src/app/view-models/bluetooth/bluetooth_view_model.dart';
import 'package:stacked/stacked.dart';

class BluetoothView extends ViewModelBuilderWidget<BluetoothViewModel> {
  @override
  bool get reactive => false;

  @override
  bool get createNewModelOnInsert => false;

  @override
  bool get disposeViewModel => true;

  @override
  Widget builder(
          BuildContext context, BluetoothViewModel viewModel, Widget child) =>
      Scaffold();

  @override
  BluetoothViewModel viewModelBuilder(BuildContext context) =>
      BluetoothViewModel();
}
