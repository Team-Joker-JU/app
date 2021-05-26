import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:ims/src/app/view-models/bluetooth_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../../view-models/bluetooth_view_model.dart';

class DeviceCard extends ViewModelBuilderWidget<BluetoothViewModel> {
  final BluetoothViewModel _viewModel;
  final BluetoothDevice _device;

  const DeviceCard(this._viewModel, this._device);

  @override
  bool get disposeViewModel => false;

  @override
  Widget builder(
      BuildContext context, BluetoothViewModel viewModel, Widget? child) {
    return Card(
      child: ListTile(
        leading: Container(
          height: double.infinity,
          child:
              Icon(Icons.bluetooth_searching, color: Theme.of(context).accentColor, size: 30),
        ),
        title: Text(this._device.name.isNotEmpty
            ? this._device.name
            : "-"),
        subtitle: Text(this._device.id.id),
        trailing: ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 100, height: 40),
          child: (viewModel.selectedDevice == null) 
            ? button(context, _viewModel, _device) 
            : (viewModel.selectedDevice! == _device) 
            ? selectedButton(context)
            : disabledButton(context)
        ),
      ),
    );
  }

  @override
  BluetoothViewModel viewModelBuilder(BuildContext context) {
    return _viewModel;
  }

  ElevatedButton button(BuildContext context, BluetoothViewModel viewModel, BluetoothDevice device) {
    return ElevatedButton(
      child: Text("Connect"),
      onPressed: () async => viewModel.connect(_device),
    );
  }

  ElevatedButton disabledButton(BuildContext context) {
    return ElevatedButton(
      child: Text("Connect"),
      onPressed: null,
    );
  }

  ElevatedButton selectedButton(BuildContext context) {
    return ElevatedButton(
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(),
      ),
      onPressed: () {
        return;
      },
    );
  }
}
