import 'package:flutter/material.dart';
import 'package:ims/src/app/view-models/bluetooth_view_model.dart';
import 'package:ims/src/app/view-models/handshake_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HandshakeView extends ViewModelBuilderWidget<HandshakeViewModel> {
  @override
  bool get reactive => true;

  @override
  bool get createNewModelOnInsert => true;

  @override
  bool get disposeViewModel => true;

  @override
  void onViewModelReady(HandshakeViewModel viewModel) async {
    return viewModel.initialize();
  }

  @override
  HandshakeViewModel viewModelBuilder(BuildContext context) {
    return HandshakeViewModel();
  }

  @override
  Widget builder(
      BuildContext context, HandshakeViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pair with mower"),
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: SpinKitPulse(
              duration: Duration(milliseconds: 1200),
              color: Colors.blue,
              size: 500,
            ),
          ),
          Container(
            child: SpinKitPulse(
              duration: Duration(milliseconds: 1200),
              color: Colors.blue,
              size: 300,
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white
                ),
                borderRadius: BorderRadius.all(Radius.circular(75)),
                color: Colors.white,
              ),
              child: Icon(
                Icons.bluetooth,
                size: 175,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      )
    );
  }
}
