import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:namer_app/models/task_model.dart';
import 'package:namer_app/view_models/app_view_model.dart';
import 'package:provider/provider.dart';

class AddTaskBottomSheetView extends StatefulWidget {
  const AddTaskBottomSheetView({super.key});

  @override
  State<AddTaskBottomSheetView> createState() => _AddTaskBottomSheetViewState();
}

class _AddTaskBottomSheetViewState extends State<AddTaskBottomSheetView> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController entryController = TextEditingController();

    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: 150,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: SizedBox(
                    height: 40,
                    width: 250,
                    child: TextField(
                      onSubmitted: (value) {
                        if (entryController.text.isNotEmpty) {
                          Task newTask = Task(entryController.text, false,
                              viewModel.repNum, viewModel.serNum);
                          viewModel.addTask(newTask);
                          entryController.clear();
                        }
                        Navigator.of(context).pop();
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 5),
                          filled: true,
                          fillColor: viewModel.clrLv2,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none))),
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: viewModel.clrLv4,
                      autofocus: true,
                      autocorrect: false,
                      controller: entryController,
                      style: TextStyle(
                          color: viewModel.clrLv4,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          child: Container(
                            decoration: BoxDecoration(
                                color: viewModel.clrLv2,
                                borderRadius: BorderRadius.circular(10)),
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  size: 30,
                                ),
                                tooltip: 'Add rep',
                                onPressed: () {
                                  viewModel.setRepValue(true);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 170,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: viewModel.clrLv2,
                                borderRadius: BorderRadius.circular(10)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Number Rep: ${viewModel.repNum}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: viewModel.clrLv3,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Align(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: viewModel.clrLv2,
                                  borderRadius: BorderRadius.circular(10)),
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    size: 30,
                                  ),
                                  tooltip: 'Remove rep',
                                  onPressed: () {
                                    viewModel.setRepValue(false);
                                  },
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
