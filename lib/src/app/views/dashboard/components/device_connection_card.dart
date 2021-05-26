import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ims/src/app/view-models/dashboard_view_model.dart';
import 'package:ims/src/app/view-models/remote_view_model.dart';
import 'package:signal_strength_indicator/signal_strength_indicator.dart';
import 'package:stacked/stacked.dart';

class DeviceConnectionCard extends ViewModelBuilderWidget<DashboardViewModel> {
  final DashboardViewModel _viewModel;

  const DeviceConnectionCard(this._viewModel);

  @override
  bool get disposeViewModel => false;

  @override
  Widget builder(BuildContext context, DashboardViewModel viewModel, Widget? child) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bluetooth status", style: Theme.of(context).textTheme.headline2),
            Divider(color: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Device name"),
                Text("19239129"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Device adress"),
                Text("19239129"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Status"),
                Text("Connected"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) {
    return _viewModel;
  }
}
