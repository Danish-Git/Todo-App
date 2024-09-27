import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/index.dart';
import '../../global/widgets/text/index.dart';
import '../home/index.dart';

class DashboardController extends GetxController {
  ///   [selectedIndex] is used to hold the value of index of selected bottom
  ///   navigation bar in case of mobile view and index of selected item from
  ///   menu items in case of tablet view
  int selectedIndex = 0;

  ///   [mainDrawerItems] is a getter that provide list of menu items used in
  ///   case of tablet view
  List<NavigationRailDestination> get mainDrawerItems => <NavigationRailDestination>[
    NavigationRailDestination(
      icon: Icon(Icons.home, color: EMAppTheme.themeColors.text),
      selectedIcon: const Icon(Icons.home),
      label: const TextWidget(text: "Home"),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.person, color: EMAppTheme.themeColors.text),
      selectedIcon: const Icon(Icons.person),
      label: const TextWidget(text: "Person"),
    )
  ];

  ///   [bottomNavigationItems] is a getter that provides list of bottom
  ///   navigation items used in case of mobile view
  List<NavigationDestination> get bottomNavigationItems => <NavigationDestination>[
    NavigationDestination(
      label: 'Home',
      icon: Icon(Icons.home, color: EMAppTheme.themeColors.text),
      selectedIcon: const Icon(Icons.home),
    ),
    NavigationDestination(
      label: 'Person',
      icon: Icon(Icons.person, color: EMAppTheme.themeColors.text),
      selectedIcon: const Icon(Icons.person),
    )
  ];

  @override
  void onInit() {
    super.onInit();
    loadData();
  }
  ///   [loadData] method is used to load the data foe initial processing which
  ///   also include initializations of various necessary services or listeners
  ///   in over case it is notification listeners
  Future<void> loadData() async {
    await loadCategories();
  }

  ///   [loadCategories] method is used to load default categories in local BD
  Future<void> loadCategories() async {
    try {
      // await CategoryRepository.loadCategories();
    } catch (e) {
      rethrow;
    }
  }

  ///   [pages] is used for navigation purpose based on selected index
  Widget pages (index) {
    switch(index) {
      case 0:
        return const HomeView();
      case 1:
        return const HomeView();
      default:
        return Container();
    }
  }

  ///   [onItemSelection] method is used to update the selected index of menu
  ///   item in case of tab view and index of bottom navigation item in case
  ///   of mobile view
  void onItemSelection(int? index) {
    selectedIndex = index ?? 0;
    update();
  }
}