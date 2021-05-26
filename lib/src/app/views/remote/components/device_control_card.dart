import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ims/src/app/view-models/dashboard_view_model.dart';
import 'package:ims/src/app/view-models/remote_view_model.dart';
import 'package:signal_strength_indicator/signal_strength_indicator.dart';
import 'package:stacked/stacked.dart';

class DeviceControlCard extends ViewModelBuilderWidget<RemoteViewModel> {
  final RemoteViewModel _viewModel;

  const DeviceControlCard(this._viewModel);

  @override
  bool get disposeViewModel => false;

  @override
  Widget builder(BuildContext context, RemoteViewModel viewModel, Widget? child) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Controls", style: Theme.of(context).textTheme.headline2),
            Divider(color: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Automove"),
                Transform.translate(
                  offset: const Offset(10, 0),
                  child: Switch(
                    value: viewModel.isAutomodeToggled,
                    onChanged: (value) async => viewModel.toggleAutomode(),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Collision avoidance"),
                SignalStrengthIndicator.sector(
                  value: 0.6,
                  size: 35,
                  barCount: 10,
                  spacing: 0.5,
                  activeColor: Theme.of(context).accentColor,
                )
              ],
            ),
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
