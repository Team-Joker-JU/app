import 'package:control_pad/views/joystick_view.dart';
import 'package:flutter/material.dart';
import 'package:ims/src/app/view-models/remote_view_model.dart';
import 'package:ims/src/app/views/remote/components/device_data_card.dart';
import 'package:ims/src/app/views/shared/default_safe_area.dart';
import 'package:stacked/stacked.dart';

class Body extends ViewModelBuilderWidget<RemoteViewModel> {
  final RemoteViewModel _viewModel;

  const Body(this._viewModel);

  @override
  bool get disposeViewModel => false;

  @override
  Widget builder(BuildContext context, RemoteViewModel viewModel, Widget? child) {
    return DefaultSafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DeviceDataCard(_viewModel),
          SizedBox(height: 10),
          JoystickView(
            size: 300,
            onDirectionChanged: (degree, distance) async => viewModel.onDirectionChanged(
              degree,
              distance,
            ),
          )
        ],
      ),
    );
  }

  @override
  RemoteViewModel viewModelBuilder(BuildContext context) {
    return _viewModel;
  }
}
