import 'package:flutter/material.dart';
import 'package:ims/src/app/view-models/bluetooth_view_model.dart';
import 'package:ims/src/app/views/bluetooth/components/body.dart';
import 'package:stacked/stacked.dart';
import 'package:system_settings/system_settings.dart';

class BluetoothView extends ViewModelBuilderWidget<BluetoothViewModel> {
  final title = "Bluetooth";
  
  @override
  bool get reactive => true;

  @override
  bool get createNewModelOnInsert => true;

  @override
  bool get disposeViewModel => true;

  @override
  void onViewModelReady(BluetoothViewModel viewModel) async {
    return viewModel.initialize();
  }

  @override
  BluetoothViewModel viewModelBuilder(BuildContext context) {
    return BluetoothViewModel();
  }

  @override
  Widget builder(
      BuildContext context, BluetoothViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title, 
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 10,
        actions: <Widget>[
          viewModel.isRefreshing
              ? IconButton(
                  onPressed: null,
                  icon: Icon(Icons.refresh, color: Colors.black12, size: 30))
              : IconButton(
                  onPressed: () async => await viewModel.refresh(),
                  icon: Icon(Icons.refresh, color: Colors.white, size: 30)),
        ],
      ),
      body: Body(viewModel),
    );
  }
}
