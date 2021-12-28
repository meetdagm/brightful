
import 'package:brightful/ui/components/bottom_button_layout.dart';
import 'package:brightful/ui/components/root_layout.dart';
import 'package:brightful/ui/components/self_sizing_list_view.dart';
import 'package:brightful/ui/roster/roster_viewmodel.dart';
import 'package:brightful/ui/shared/base_color.dart';
import 'package:brightful/ui/shared/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
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
          navTitle: 'Roster',
          backgroundColor: BaseColors.white,
          child: viewModel.isBusy ? loadingSpinner : SelfSizingListView(
            padding: const EdgeInsets.all(17),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Name'),
                  Text('Cost'),
                ],
              ),
              ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: viewModel.count,
                    itemBuilder: (builderContext, index) {
                      return ListTile(
                        leading: IconButton(
                          icon: const Icon(CupertinoIcons.delete),
                          onPressed: () => viewModel.selectedIndexAt(index: index),
                        ),
                        title: Text(viewModel.titleAt(index: index)),
                        trailing: Text(viewModel.descriptionAt(index: index)),
                      );
                    },
                  ),
            ],
          ),
        );
      },
    );
  }
}