import 'package:brightful/ui/components/root_layout.dart';
import 'package:brightful/ui/components/self_sizing_list_view.dart';
import 'package:brightful/ui/roster/roster_viewmodel.dart';
import 'package:brightful/ui/shared/base_color.dart';
import 'package:brightful/ui/shared/base_fonts.dart';
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
          child: viewModel.isBusy || !viewModel.dataReady ? loadingSpinner : SelfSizingListView(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Name'),
                  Text('Cost'),
                ],
              ),
              const Divider(),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: viewModel.count,
                itemBuilder: (builderContext, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              visualDensity: VisualDensity.compact,
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints.tight(const Size(25,40)),
                              icon: const Icon(CupertinoIcons.delete, color: Colors.red),
                              onPressed: () => viewModel.selectedIndexAt(index: index),
                              ),
                              horizontalSpaceTiny,
                              horizontalSpaceTiny,
                              Text(viewModel.titleAt(index: index), style: BaseFonts.headline3(color: BaseColors.grey3)),
                          ],
                        ),
                        Text(viewModel.descriptionAt(index: index), style: BaseFonts.body(color: BaseColors.grey3)),
                      ],
                    ),
                  );
                },
              ),
              verticalSpaceMedium,
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: BaseFonts.headline3(color: BaseColors.grey3)),
                  Text(viewModel.getTotal, style: BaseFonts.headline3(color: BaseColors.grey3),),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}