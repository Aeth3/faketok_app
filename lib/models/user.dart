import 'package:flutter/material.dart';

class User {
  const User(
      {
      required this.id,
      required this.username,
      required this.email,
      required this.following,
      required this.followers,
      required this.likes,
      required this.at,
       required this.userImage});

  final String id;
  final String username;
  final String email;
  final int following;
  final int followers;
  final int likes;
  final String at;
  final AssetImage userImage;
}
