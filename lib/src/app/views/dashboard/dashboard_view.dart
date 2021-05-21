import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ims/src/app/view-models/dashboard_view_model.dart';
import 'package:ims/src/app/views/dashboard/components/body.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends ViewModelBuilderWidget<DashboardViewModel> {
  @override
  bool get reactive => true;

  @override
  bool get createNewModelOnInsert => true;

  @override
  bool get disposeViewModel => true;

  @override
  void onViewModelReady(DashboardViewModel viewModel) async {}

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) {
    return DashboardViewModel();
  }

  @override
  Widget builder(BuildContext context, DashboardViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          IconButton(
            onPressed: () async => viewModel.disconnect(),
            icon: Icon(Icons.power_settings_new, color: Colors.white, size: 30),
          ),
        ],
      ),
      body: Body(viewModel),
    );
  }
}
