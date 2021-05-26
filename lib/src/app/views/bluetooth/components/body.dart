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
    return Container(
      color: Theme.of(context).primaryColor,
      child: DefaultSafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: DeviceList(viewModel),
            ),
            Card(
              child: viewModel.isRefreshing
                  ? LinearProgressIndicator(
                      backgroundColor: Colors.black12,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).accentColor
                      ),
                    )
                  : LinearProgressIndicator(
                      backgroundColor: Colors.black12,
                      value: 0,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  BluetoothViewModel viewModelBuilder(BuildContext context) {
    return _viewModel;
  }
}
