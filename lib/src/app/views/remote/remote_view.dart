import 'package:control_pad/control_pad.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ims/src/app/view-models/remote_view_model.dart';
import 'package:ims/src/app/views/remote/components/body.dart';
import 'package:stacked/stacked.dart';

class RemoteView extends ViewModelBuilderWidget<RemoteViewModel> {
  final title = "Remote Control";

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
          centerTitle: true,
          title: Text(
            title, 
            style: Theme.of(context).textTheme.headline1,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 10,
        ),
        body: Body(viewModel));
  }
}
