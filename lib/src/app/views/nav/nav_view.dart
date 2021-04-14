import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
          selectedItemColor: Colors.red,
          backgroundColor: Colors.black,
          currentIndex: viewModel.currentIndex,
          onTap: viewModel.setIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "Second",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Third",
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
        return this;
      case 1:
        return this;
      case 2:
        return this;
    }
  }
}
