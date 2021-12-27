

import 'package:brightful/ui/ActorCreate/create_actor_view_model.dart';
import 'package:brightful/ui/components/base_textfield.dart';
import 'package:brightful/ui/components/bottom_button_layout.dart';
import 'package:brightful/ui/components/root_layout.dart';
import 'package:brightful/ui/components/self_sizing_list_view.dart';
import 'package:brightful/ui/shared/base_color.dart';
import 'package:brightful/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


class CreateActorView extends StatelessWidget {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  CreateActorView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateActorViewModel>.reactive(
      viewModelBuilder: () => CreateActorViewModel(), 
      builder: (vmContext, viewModel, vmChild) {
        return RootLayout(
          navTitle: "Actor Information",
          backgroundColor: BaseColors.white,
          child: BottomButtonLayout(
            title: 'Submit',
            busy: viewModel.isBusy,
            action: () {
              var formState = _formKey.currentState;
              if (formState == null) return ;
                
              if(formState.validate()) {
                formState.save();
                viewModel.add();
              }
            },
            child: viewModel.isBusy ? loadingSpinner : Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child:  SelfSizingListView(
                padding: const EdgeInsets.all(13),
                children: [
                  BaseTextField(
                    validator: viewModel.validateName,
                    placeholder: 'Full Name',
                    onSaved: viewModel.setName,
                  ),
                  verticalSpaceMedium,
                  BaseTextField(
                    placeholder: 'Description',
                    onSaved: viewModel.setDescription,
                    validator: viewModel.validateDescription,
                    maxLines: 4,
                  ),
                  verticalSpaceMedium,
                  BaseTextField(
                    placeholder: 'Rate',
                    prefixText: '\$',
                    keyboardType: TextInputType.number,
                    onChanged: viewModel.rateChanged,
                    onSaved: viewModel.setRate,
                    controller: viewModel.rateController,
                    validator: viewModel.validateRate,
                  ),
                ],
              ),
            )
          )
        );
      },
    );
  }
}