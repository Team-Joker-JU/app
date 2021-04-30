import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:ims/src/app/view-models/bluetooth_view_model.dart';
import 'package:ims/src/app/views/components/shadow_card.dart';
import 'package:stacked/stacked.dart';

class DeviceCard extends ViewModelBuilderWidget<BluetoothViewModel> {
  final BluetoothViewModel _viewModel;
  final ScanResult _result;

  const DeviceCard(this._viewModel, this._result);

  @override
  bool get disposeViewModel => false;

  @override
  Widget builder(
      BuildContext context, BluetoothViewModel viewModel, Widget? child) {
    return Card(
      color: Colors.white,
      //onTap: () async => viewModel.connect(_index),
      child: ListTile(
        leading: Container(
          height: double.infinity,
          child:
              Icon(Icons.bluetooth_searching, color: Colors.black54, size: 30),
        ),
        title: Text(this._result.device.name.isNotEmpty
            ? this._result.device.name
            : "-"),
        subtitle: Text(this._result.device.id.id),
        trailing: ElevatedButton(
          child: Text("Connect"),
          style: ButtonStyle(),
          onPressed: () async => viewModel.connect(this._result.device),
        ),
      ),
    );
  }

  @override
  BluetoothViewModel viewModelBuilder(BuildContext context) {
    return _viewModel;
  }
}
