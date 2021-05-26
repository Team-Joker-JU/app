import 'package:control_pad/views/joystick_view.dart';
import 'package:flutter/material.dart';
import 'package:ims/src/app/view-models/remote_view_model.dart';
import 'package:ims/src/app/views/remote/components/device_control_card.dart';
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
    return Container(
      color: Theme.of(context).primaryColor,
      child: DefaultSafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DeviceControlCard(_viewModel),
            DeviceDataCard(_viewModel),
            SizedBox(height: 10),
            Expanded(
              child: JoystickView(
                backgroundColor: Theme.of(context).accentColor,
                innerCircleColor: Colors.black26,
                iconsColor: Colors.black,
                size: MediaQuery.of(context).size.width * 0.6,
                onDirectionChanged: (degree, distance) async => viewModel.onDirectionChanged(
                  degree,
                  distance,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  RemoteViewModel viewModelBuilder(BuildContext context) {
    return _viewModel;
  }
}
