import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:namer_app/view_models/app_view_model.dart';
import 'package:namer_app/views/bottom_sheets/delete_bottom_sheet_view.dart';
import 'package:namer_app/views/bottom_sheets/setting_bottom_sheet_view.dart';
import 'package:provider/provider.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Row(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              "Welcome back,",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w400,
                                color: viewModel.clrLv4,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              viewModel.username,
                              style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                color: viewModel.clrLv4,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                child: InkWell(
              onTap: () {
                viewModel.bottomSheetBuilder(DeleteBottomSheetView(), context);
              },
              child: Icon(
                Icons.delete,
                color: viewModel.clrLv3,
                size: 40,
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () {
                viewModel.bottomSheetBuilder(SettingBottomSheetView(), context);
              },
              child: Icon(
                Icons.settings,
                color: viewModel.clrLv3,
                size: 40,
              ),
            )),
          ],
        );
      },
    );
  }
}
