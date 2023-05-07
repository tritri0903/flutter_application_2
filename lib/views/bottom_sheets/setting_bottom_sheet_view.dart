import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:namer_app/models/task_model.dart';
import 'package:namer_app/view_models/app_view_model.dart';
import 'package:provider/provider.dart';

class SettingBottomSheetView extends StatefulWidget {
  const SettingBottomSheetView({super.key});

  @override
  State<SettingBottomSheetView> createState() => _SettingBottomSheetViewState();
}

class _SettingBottomSheetViewState extends State<SettingBottomSheetView> {
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
                          viewModel.updateUsername(entryController.text);
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
              ],
            ),
          ),
        );
      },
    );
  }
}
