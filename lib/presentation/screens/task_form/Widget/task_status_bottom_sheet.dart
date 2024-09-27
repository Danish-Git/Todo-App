import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/themes/index.dart';
import '../../../global/widgets/text/constants/font_size.dart';
import '../../../global/widgets/text/constants/font_weight.dart';
import '../../../global/widgets/text/index.dart';

class TaskStatusBottomSheet extends StatelessWidget {
  const TaskStatusBottomSheet({super.key, this.selectedStatus});

  final bool? selectedStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: Get.height * 0.90),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        color: EMAppTheme.themeColors.lightGray,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ///   Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Select Task Status",
                      fontSize: EMFontSize.title,
                      fontWeight: EMFontWeight.bold,
                      color: EMAppTheme.themeColors.primary,
                    ),
                    IconButton(
                        onPressed: () => Get.back(result: null),
                        icon: Icon(Icons.close, color: EMAppTheme.themeColors.primary, size: 18))
                  ],
                ),

                getStatusItem(
                  onTap: () => Get.back(result: true),
                  label: "Completed",
                  selectedValue: selectedStatus
                ),

                getStatusItem(
                  onTap: () => Get.back(result: false),
                  label: "Pending",
                  selectedValue: !(selectedStatus ?? false)
                )
              ],
            ),
          ),
        )
      )
    );
  }

  Widget getStatusItem({VoidCallback? onTap, String? label, bool? selectedValue}) => Material(
    color: EMAppTheme.themeColors.lightGray,
    child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: label ?? "",
                fontSize: EMFontSize.text,
                color: EMAppTheme.themeColors.primary,
              ),

              Visibility(
                visible: selectedValue ?? false,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.check, color: EMAppTheme.themeColors.success, size: 18)),
              )
            ],
          ),
        ),
    ),
  );
}
