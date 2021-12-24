
import 'package:brightful/ui/ActorCollectionPreview/actor_collection_preview_model.dart';
import 'package:brightful/ui/components/bottom_button_layout.dart';
import 'package:brightful/ui/components/root_layout.dart';
import 'package:brightful/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ActorCollectionPreview extends StatelessWidget {

  const ActorCollectionPreview({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<ActorCollectionPreviewModel>.reactive(
      viewModelBuilder: () => ActorCollectionPreviewModel(), 
      builder: (vmContext, viewModel, vmChild) {
        return RootLayout(
          child: !viewModel.dataReady || viewModel.isBusy ? loadingSpinner : BottomButtonLayout(
            title: 'Add New Actor',
            action: viewModel.add,
            child: ListView.builder(
              itemCount: viewModel.count,
              itemBuilder: (builderContext, index) {
                return ListTile(
                  onTap: () => viewModel.selectedItemAt(index: index),
                  title: Text(viewModel.titleForItemAt(index: index)),
                  subtitle: Column(
                    children: [
                      Text(viewModel.subTitleForItemAt(index: index)),
                      Text(viewModel.descriptionForitemAt(index: index))
                    ],
                  ),
                );
              },
            ),
          ),
        );

      },
    );
  }

}