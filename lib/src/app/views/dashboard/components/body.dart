import 'package:flutter/material.dart';
import 'package:ims/src/app/view-models/dashboard_view_model.dart';
import 'package:ims/src/app/views/dashboard/components/device_connection_card.dart';
import 'package:ims/src/app/views/shared/default_safe_area.dart';
import 'package:stacked/stacked.dart';

class Body extends ViewModelBuilderWidget<DashboardViewModel> {
  final DashboardViewModel _viewModel;

  const Body(this._viewModel);

  @override
  bool get disposeViewModel => false;

  @override
  Widget builder(BuildContext context, DashboardViewModel viewModel, Widget? child) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: DefaultSafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DeviceConnectionCard(viewModel),
            SizedBox(height: 10),
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
