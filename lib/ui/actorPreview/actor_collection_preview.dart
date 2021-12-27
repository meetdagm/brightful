
import 'package:brightful/ui/components/bottom_button_layout.dart';
import 'package:brightful/ui/components/root_layout.dart';
import 'package:brightful/ui/shared/base_color.dart';
import 'package:brightful/ui/shared/base_fonts.dart';
import 'package:brightful/ui/shared/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'actor_collection_preview_model.dart';

class ActorCollectionPreview extends StatelessWidget {

  const ActorCollectionPreview({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<ActorCollectionPreviewModel>.reactive(
      viewModelBuilder: () => ActorCollectionPreviewModel(), 
      builder: (vmContext, viewModel, vmChild) {
        return RootLayout(
          trailingButtonAction: viewModel.viewRoster,
          trailingButtonTitle: 'View Roster',
          backgroundColor: BaseColors.white,
          navTitle: 'Available Talent',
          child: !viewModel.dataReady || viewModel.isBusy ? loadingSpinner : BottomButtonLayout(
            title: 'Add New Actor',
            busy: viewModel.isBusy,
            action: viewModel.add,
            child: ListView.separated(
              itemCount: viewModel.count,
              separatorBuilder: (separatorContext, index) {
                return const Divider(height: 0);
              }, 
              itemBuilder: (itemContext, index) {
                return ListTile(
                  minVerticalPadding: 20,
                  tileColor: BaseColors.white,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(viewModel.titleForItemAt(index: index), style: BaseFonts.title3()),
                          verticalSpaceTiny,
                          Text("Cost: ${viewModel.subTitleForItemAt(index: index)}", style: BaseFonts.body(color: BaseColors.grey3),),
                          verticalSpaceSmall,
                        ],
                      ),
                      IconButton(
                        icon: const CircleAvatar(child: Icon(CupertinoIcons.add, color: BaseColors.white, size: 17,), backgroundColor: BaseColors.mainColor, radius: 13,),
                        onPressed: () => viewModel.selectedItemAt(index: index),
                      ),
                    ],
                  ),
                  subtitle: Text(viewModel.descriptionForitemAt(index: index), style: BaseFonts.subHead(color: BaseColors.grey2), maxLines: 2, overflow: TextOverflow.ellipsis,),
                );
              }, 
            ),
          ),
        );

      },
    );
  }

}


