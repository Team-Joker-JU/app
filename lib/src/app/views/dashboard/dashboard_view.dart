import 'package:flutter/material.dart';
import 'package:ims/src/app/view-models/dashboard/dashboard_view_model.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends ViewModelBuilderWidget<DashboardViewModel>{
  @override
  bool get reactive => true;

  @override
  bool get createNewModelOnInsert => true;

  @override
  bool get disposeViewModel => true;

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) {
    return DashboardViewModel();
  }

  @override
  Widget builder(BuildContext context, DashboardViewModel viewModel, Widget child) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Connection Status',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(height: 16.0,),
                    Text(
                      'Currently connected to <device name>',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}