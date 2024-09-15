import 'package:faketok_app/models/video.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FriendsNotifier extends StateNotifier<List<Video>> {
  FriendsNotifier() : super([]);

  void filterFriends(List<Video> videos) {
    state = videos.where((video) => video.isFriends).toList();
  }
}

final friendsNotifierProvider =
    StateNotifierProvider<FriendsNotifier, List<Video>>(
        (ref) => FriendsNotifier());
