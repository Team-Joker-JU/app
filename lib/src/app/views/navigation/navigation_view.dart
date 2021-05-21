import 'package:flutter/material.dart';
import 'package:ims/src/app/views/bluetooth/bluetooth_view.dart';
import 'package:ims/src/app/views/dashboard/dashboard_view.dart';
import 'package:ims/src/app/views/remote/remote_view.dart';
import 'package:stacked/stacked.dart';

class NavigationView extends ViewModelBuilderWidget<IndexTrackingViewModel> {
  @override
  Widget builder(BuildContext context, IndexTrackingViewModel viewModel, Widget? child) {
    return Scaffold(
      body: getViewForIndex(viewModel.currentIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black)],
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.lightBlue,
          backgroundColor: Colors.white,
          currentIndex: viewModel.currentIndex,
          onTap: viewModel.setIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_remote),
              label: "Remote control",
            )
          ],
        ),
      ),
    );
  }

  @override
  IndexTrackingViewModel viewModelBuilder(BuildContext context) {
    return IndexTrackingViewModel();
  }

  Widget? getViewForIndex(int index) {
    switch (index) {
      case 0:
        return DashboardView();
      case 1:
        return RemoteView();
    }
  }
}
