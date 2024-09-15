import 'package:faketok_app/models/video.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FollowingNotifier extends StateNotifier<List<Video>> {
  FollowingNotifier() : super([]);

  void filterFollowing(List<Video> videos) {
    state = videos.where((video) => video.isFollowing).toList();
  }
}

final followingNotifierProvider =
    StateNotifierProvider<FollowingNotifier, List<Video>>(
        (ref) => FollowingNotifier());
