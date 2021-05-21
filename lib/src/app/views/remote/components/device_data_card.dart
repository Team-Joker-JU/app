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
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 5.0, left: 10.0, right: 10.0),
            child: Text(
              "Bluetooth device status",
              style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(thickness: 4),
          Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 10.0, left: 10.0, right: 10.0),
            child: Text(
              "Currently connected to .",
              style: TextStyle(color: Color(0xFFFF9800), fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  RemoteViewModel viewModelBuilder(BuildContext context) {
    return _viewModel;
  }
}
