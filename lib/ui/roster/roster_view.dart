
import 'package:brightful/ui/components/bottom_button_layout.dart';
import 'package:brightful/ui/components/root_layout.dart';
import 'package:brightful/ui/components/self_sizing_list_view.dart';
import 'package:brightful/ui/roster/roster_viewmodel.dart';
import 'package:brightful/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';







class RosterView extends StatelessWidget {
  
  
  const RosterView({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RosterViewModel>.reactive(
      viewModelBuilder: () => RosterViewModel(), 
      builder: (vmContext, viewModel, vmChild) {
        return RootLayout(
          child: !viewModel.dataReady || viewModel.isBusy ? loadingSpinner : SelfSizingListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Name'),
                  const Text('Cost'),
                  ListView.builder(
                    itemCount: viewModel.count,
                    itemBuilder: (builderContext, index) {
                      return const Text('Actor');
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}