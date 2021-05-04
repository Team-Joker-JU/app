import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../view-models/bluetooth_view_model.dart';

class BluetoothCard extends ViewModelBuilderWidget<BluetoothViewModel> {
  final BluetoothViewModel _viewModel;

  const BluetoothCard(this._viewModel);

  @override
  bool get disposeViewModel => false;

  @override
  Widget builder(
      BuildContext context, BluetoothViewModel viewModel, Widget? child) {
    return Card(
      color: Colors.white,
      child: ListTile(
        title: Text("Bluetooth"),
        trailing: Switch(
          value: viewModel.isEnabled,
          onChanged: (bool value) {  },
        ),
      ),
    );
  }

  @override
  BluetoothViewModel viewModelBuilder(BuildContext context) {
    return _viewModel;
  }
}