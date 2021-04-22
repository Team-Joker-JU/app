import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ims/src/app/view-models/bluetooth/bluetooth_view_model.dart';
import 'package:ims/src/app/views/components/shadow_card.dart';
import 'package:stacked/stacked.dart';

class DeviceCard extends ViewModelBuilderWidget<BluetoothViewModel> {
  final BluetoothViewModel _viewModel;
  final int _index;

  const DeviceCard(this._viewModel, this._index);

  @override
  bool get disposeViewModel => false;

  @override
  Widget builder(
      BuildContext context, BluetoothViewModel viewModel, Widget child) {
    return ShadowCard(
      child: InkWell(
        onTap: () async => viewModel.connect(_index),
        child: ListTile(
          leading: Container(
            height: double.infinity,
            child: Icon(Icons.bluetooth_searching,
                color: Colors.black54, size: 30),
          ),
          title: Text(viewModel.devices[_index].name ?? "Name not detected"),
          subtitle: Text(viewModel.devices[_index].id.id),
        ),
      ),
    );
  }

  @override
  BluetoothViewModel viewModelBuilder(BuildContext context) {
    return _viewModel;
  }
}
