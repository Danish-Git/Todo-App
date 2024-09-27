import 'package:esferasoft/data/models/data_models/task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../screens/home/index.dart';
import '../bottom_sheet/index.dart';

class ResponsiveScaffoldController extends GetxController with GetSingleTickerProviderStateMixin {

  ///   [articleIconSlideController] is used to control animation of menu items
  ///   in case of tab view and bottom navigation bar items in case of mobile view
  late AnimationController articleIconSlideController;

  @override
  void onInit() {
    super.onInit();

    ///   initialization of animation controller
    articleIconSlideController = AnimationController(
      duration: const Duration(milliseconds: 120),
      vsync: this,
    )..forward();

  }

  ///   [addExpense] method is used to add expense, This method is used only in
  ///   case of tablet view where user can clicks on add expense button available in menu items
  Future<void> addExpense(bool isMobile) async {
    TaskModel? expense = await getBottomSheet(
      isMobile: isMobile,
      child: const HomeView(),
    );

    if(expense != null) {
      refresh();
    }
  }

}