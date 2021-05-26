import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ims/src/app/view-models/dashboard_view_model.dart';
import 'package:ims/src/app/view-models/remote_view_model.dart';
import 'package:stacked/stacked.dart';

class DeviceDataCard extends ViewModelBuilderWidget<RemoteViewModel> {
  final RemoteViewModel _viewModel;

  const DeviceDataCard(this._viewModel);

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
            Text("Realtime data", style: Theme.of(context).textTheme.headline2),
            Divider(color: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Acceleration"),
                Text("40"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Steering"),
                Text("40"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Automode"),
                Text("Off"),
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
