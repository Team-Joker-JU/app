import 'package:flutter/material.dart';
import 'package:ims/src/app/view-models/bluetooth_view_model.dart';
import 'package:ims/src/app/views/bluetooth/components/device_list.dart';
import 'package:ims/src/app/views/shared/default_safe_area.dart';
import 'package:stacked/stacked.dart';

class Body extends ViewModelBuilderWidget<BluetoothViewModel> {
  final BluetoothViewModel _viewModel;

  const Body(this._viewModel);

  @override
  bool get disposeViewModel => false;

  @override
  Widget builder(BuildContext context, BluetoothViewModel viewModel, Widget? child) {
    return DefaultSafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Devices"),
          Card(
            child: viewModel.isRefreshing
                ? LinearProgressIndicator(
                    backgroundColor: Colors.black12,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.blueAccent,
                    ),
                  )
                : LinearProgressIndicator(
                    backgroundColor: Colors.black12,
                    value: 0,
                  ),
          ),
          SizedBox(height: 10),
          Flexible(
            child: DeviceList(viewModel),
          )
        ],
      ),
    );
  }

  @override
  BluetoothViewModel viewModelBuilder(BuildContext context) {
    return _viewModel;
  }
}
