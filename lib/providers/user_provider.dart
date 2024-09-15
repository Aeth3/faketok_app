import 'package:faketok_app/data/dummy.dart';
import 'package:faketok_app/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<List<User>>{
  UserNotifier(): super(dummyUser);
}

final userNotifierProvider = StateNotifierProvider<UserNotifier, List<User>>((ref) => UserNotifier());