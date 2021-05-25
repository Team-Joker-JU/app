import 'package:control_pad/control_pad.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ims/src/app/view-models/remote_view_model.dart';
import 'package:ims/src/app/views/remote/components/body.dart';
import 'package:stacked/stacked.dart';

class RemoteView extends ViewModelBuilderWidget<RemoteViewModel> {
  @override
  bool get reactive => true;

  @override
  bool get createNewModelOnInsert => true;

  @override
  bool get disposeViewModel => true;

  @override
  void onViewModelReady(RemoteViewModel viewModel) async {
    return viewModel.initialize();
  }

  @override
  RemoteViewModel viewModelBuilder(BuildContext context) {
    return RemoteViewModel();
  }

  @override
  Widget builder(BuildContext context, RemoteViewModel viewModel, Widget? child) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Remote Control"),
        ),
        body: Body(viewModel));
  }
}
