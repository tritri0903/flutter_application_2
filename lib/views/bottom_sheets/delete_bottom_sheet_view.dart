import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:namer_app/models/task_model.dart';
import 'package:namer_app/view_models/app_view_model.dart';
import 'package:provider/provider.dart';

class DeleteBottomSheetView extends StatelessWidget {
  const DeleteBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Container(
          height: 125,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  viewModel.deleteAllTasks();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: viewModel.clrLv1,
                    backgroundColor: viewModel.clrLv3,
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text("Delete All"),
              ),
              SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.deleteCompetedTasks();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: viewModel.clrLv1,
                    backgroundColor: viewModel.clrLv3,
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text("Competed All"),
              ),
            ],
          ),
        );
      },
    );
  }
}
