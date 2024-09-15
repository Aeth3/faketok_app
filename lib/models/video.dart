import 'package:flutter/material.dart';

class Video {
  const Video(
      {
      required this.id,
      required this.userId,
      required this.username,
      required this.caption,
      required this.comment,
      required this.dateCreated,
      required this.favorites,
      required this.likes,
      required this.userImage,
      required this.views,
      required this.shares,
      required this.search,
      required this.isFollowing,
      required this.isFriends});

  final String id;
  final String userId;
  final String username;
  final double likes;
  final AssetImage userImage;
  final double comment;
  final double favorites;
  final DateTime dateCreated;
  final String caption;
  final double views;
  final double shares;
  final String search;
  final bool isFollowing;
  final bool isFriends;
}
