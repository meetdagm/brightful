
import 'package:brightful/ui/components/root_layout.dart';
import 'package:brightful/ui/shared/base_color.dart';
import 'package:brightful/ui/shared/ui_helpers.dart';
import 'package:brightful/ui/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      onModelReady: (model) => model.load(),
      viewModelBuilder: () => StartupViewModel(),
      builder: (vmContext, viewModel, vmChild) {
        return !viewModel.dataReady || viewModel.isBusy ? RootLayout(backgroundColor: BaseColors.white, child: loadingSpinner) : viewModel.child;
      },
    );
  }

}
