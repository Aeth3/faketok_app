import 'package:faketok_app/data/dummy.dart';
import 'package:faketok_app/models/video.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForYouVideoListNotifier extends StateNotifier<List<Video>> {
  ForYouVideoListNotifier() : super(dummyVideos);
}

final forYouVideoListNotifierProvider =
    StateNotifierProvider<ForYouVideoListNotifier, List<Video>>(
        (ref) => ForYouVideoListNotifier());
