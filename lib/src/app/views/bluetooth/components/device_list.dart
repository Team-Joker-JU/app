import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ims/src/app/view-models/bluetooth/bluetooth_view_model.dart';
import 'package:ims/src/app/views/bluetooth/components/device_cart.dart';
import 'package:stacked/stacked.dart';

class DeviceList extends ViewModelBuilderWidget<BluetoothViewModel> {
  final BluetoothViewModel _viewModel;

  const DeviceList(this._viewModel);

  @override
  bool get disposeViewModel => false;

  @override
  Widget builder(
      BuildContext context, BluetoothViewModel viewModel, Widget child) {
    return AnimationLimiter(
      key: UniqueKey(),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: viewModel.devices.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: DeviceCard(viewModel, index),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  BluetoothViewModel viewModelBuilder(BuildContext context) {
    return this._viewModel;
  }
}
