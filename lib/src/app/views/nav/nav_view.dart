import 'package:flutter/material.dart';
import 'package:ims/src/app/views/dashboard/dashboard_view.dart';
import 'package:ims/src/app/views/mower_controller/mower_controller_view.dart';
import 'package:stacked/stacked.dart';

import '../bluetooth/bluetooth_view.dart';

class NavView extends ViewModelBuilderWidget<IndexTrackingViewModel> {
  @override
  Widget builder(
      BuildContext context, IndexTrackingViewModel viewModel, Widget child) {
    return Scaffold(
      body: getViewForIndex(viewModel.currentIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black)],
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.blueAccent,
          backgroundColor: Colors.white,
          currentIndex: viewModel.currentIndex,
          onTap: viewModel.setIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.bluetooth),
              label: "Connect",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.control_camera),
              label: "Controller",
            ),
          ],
        ),
      ),
    );
  }

  @override
  IndexTrackingViewModel viewModelBuilder(BuildContext context) {
    return IndexTrackingViewModel();
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return BluetoothView();
      case 1:
        return DashboardView();
      case 2:
        return MowerControllerView();
    }
  }
}
