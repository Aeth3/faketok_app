import 'package:faketok_app/models/current_tab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabNotifier extends StateNotifier<CurrentTab> {
  TabNotifier() : super(const CurrentTab(currentTab: 2));

  void updateTab(int currentTab) {
    state = CurrentTab(currentTab: currentTab);
  }
}

final tabNotifierProvider =
    StateNotifierProvider<TabNotifier, CurrentTab>((ref) => TabNotifier());
