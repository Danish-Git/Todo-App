import 'package:esferasoft/app/helpers/helper.dart';
import 'package:esferasoft/presentation/global/widgets/button/constants/button_type.dart';
import 'package:esferasoft/presentation/global/widgets/button/inidex.dart';
import 'package:esferasoft/presentation/global/widgets/priority_selector/index.dart';
import 'package:esferasoft/presentation/global/widgets/text/constants/font_size.dart';
import 'package:esferasoft/presentation/global/widgets/text/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/enums/task_form_type.dart';
import '../../../app/helpers/form_validator.dart';
import '../../../app/themes/index.dart';
import '../../global/widgets/text_form_field/index.dart';
import 'controller.dart';

class TaskFormView extends StatelessWidget {
  const TaskFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskFormViewController>(
        global: false,
        init: TaskFormViewController(),
        builder: (controller) => Scaffold(
          backgroundColor: EMAppTheme.themeColors.primary,
          appBar: AppBar(
            backgroundColor: EMAppTheme.themeColors.primary,
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Get.back(result: true),
              icon: Icon(Icons.arrow_back,
              color: EMAppTheme.themeColors.text)),
            title: TextWidget(
              text: (controller.formType == TaskFormType.edit)? "Update Task Details" : "Add New Task",
              fontSize: EMFontSize.title,
            ),
          ),
          body: Container(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getTitleWidget("Title *"),
                          CustomTextFormField(
                            textController: controller.titleInput,
                            minLines: 1,
                            maxLines: 2,
                            maxLength: 100,
                            validator: (val) => FormValidator.requiredFieldValidator(val, errorMsg: "Please add some title"),
                          ),

                          getTitleWidget("Description"),
                          CustomTextFormField(
                            textController: controller.descriptionInput,
                            minLines: 1,
                            maxLines: 5,
                            maxLength: 500,
                          ),

                          getTitleWidget("Priority"),
                          getDescriptionWidget(
                            child: Column(
                              children: [
                                PrioritySelector(
                                  onChange: controller.onPriorityChange,
                                  selectedValue: controller.priority,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(text: "Low", color: EMAppTheme.themeColors.base,),
                                      TextWidget(text: "Mid", color: EMAppTheme.themeColors.base,),
                                      TextWidget(text: "High", color: EMAppTheme.themeColors.base,),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        getTitleWidget("Due Date *"),
                                        CustomTextFormField(
                                          textController: controller.dueDateInput,
                                          onTap: () => controller.selectDate(context),
                                          readOnly: true,
                                          prefixIcon: Icon(
                                            Icons.calendar_month,
                                            color: EMAppTheme.themeColors.text,
                                          ),
                                          keyboardType: TextInputType.datetime,
                                          validator:(val) => FormValidator.requiredFieldValidator(val, errorMsg: "Please Select Date"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        getTitleWidget("Task Statue"),
                                        CustomTextFormField(
                                          textController: controller.taskStatusInput,
                                          onTap: () => controller.selectTaskStatus(),
                                          readOnly: true,
                                          prefixIcon: Icon(
                                            Icons.task_alt_outlined,
                                            color: EMAppTheme.themeColors.text,
                                          ),
                                          keyboardType: TextInputType.datetime,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 100,)
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: controller.isLoading ? Helper.showLoading() : Container(
                      color: EMAppTheme.themeColors.primary,
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomButton(
                            buttonType: ButtonType.large,
                            title: "Save",
                            titleColor: EMAppTheme.themeColors.primary,
                            onTap: controller.validateForm,
                          ),
                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        )
    );
  }

  Widget getTitleWidget(String title) => Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 5),
    child: TextWidget(
      text: title,
      fontSize: EMFontSize.subTitle,
      color: EMAppTheme.themeColors.lightBlue,
    ),
  );

  Widget getDescriptionWidget({String? description, Widget? child}) => Container(
    width: double.maxFinite,
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      border: Border.all(color: EMAppTheme.themeColors.darkGray, width: 1),
      borderRadius: BorderRadius.circular(10)
    ),
    child: child ?? TextWidget(
      text: description ?? "",
      fontSize: EMFontSize.title,
      color: EMAppTheme.themeColors.primary,
    ),
  );
}