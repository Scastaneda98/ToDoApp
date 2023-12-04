import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/src/domain/utils/resource.dart';
import 'package:todo_app/src/presentation/pages/tasks/create/task_create_viewmodel.dart';
import 'package:todo_app/src/presentation/utils/show_dialog.dart';

class TaskCreateResponse {
  BuildContext context;
  TaskCreateViewModel viewModel;

  TaskCreateResponse(this.context, this.viewModel) {
    if(viewModel.response is Success) {
      final success = viewModel.response as Success;
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: success.data,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 3
      );
      viewModel.resetResponse();
      viewModel.resetState();
    } else if (viewModel.response is Loading) {
      buildShowDialog(context);
    } else if (viewModel.response is Failure) {
      final data = viewModel.response as Failure;
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: 'Error: ${data.error}',
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 3
      );
      viewModel.resetResponse();
    }
  }
}