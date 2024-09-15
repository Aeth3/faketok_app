import 'package:faketok_app/models/user.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key, required this.user});

  final User user;
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.user.username,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
              iconSize: 30,
              onPressed: () {},
              icon: const Icon(Icons.notifications_none)),
          IconButton(
              iconSize: 30,
              onPressed: () {},
              icon: const Icon(Icons.play_arrow_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  foregroundImage: widget.user.userImage,
                ),
              ],
            ),
            Text(
              '@${widget.user.at}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: const Color.fromARGB(148, 0, 0, 0)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.user.following.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                      Text(
                        'Following',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: const Color.fromARGB(95, 0, 0, 0)),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.user.followers.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                      Text(
                        'Followers',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: const Color.fromARGB(95, 0, 0, 0)),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.user.likes.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                      Text(
                        'Likes',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: const Color.fromARGB(95, 0, 0, 0)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color.fromARGB(255, 255, 12, 85)),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Follow',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color.fromARGB(15, 0, 0, 0)),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Message',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
